# frozen_string_literal: true

# rubocop:disable AbcSize
module Users
  class OmniauthController < ApplicationController
    def google_oauth2
      user = User.from_omniauth(request.env['omniauth.auth'])
      if user.persisted?
        flash[:notice] = I18n.t 'devise.omniauth_callbacks.success', kind: 'Google'
        sign_in_and_redirect user, event: :authentication
      else
        session['devise.google_data'] = request.env['omniauth.auth'].except(:extra)
        redirect_to new_user_registration_url, alert: user.errors.full_messages.join("\n")
      end
    end

    def passthru
      render file: Rails.root.join('public', '404.html'), status: :not_found, layout: false
    end

    def after_sign_in_path_for(resource)
      if resource.email_verified?
        super resource
      else
        finish_signup_path(resource)
      end
    end

    def redirect_callbacks
      paramsnamespace = request.env['omniauth.params']['namespace_name']
      paramsresource  = request.env['omniauth.params']['resource_class']
      devise_mapping = [paramsnamespace, paramsresource.underscore.tr('/', '_')].compact.join('_')
      path = "#{Devise.mappings[devise_mapping.to_sym].fullpath}/#{params[:provider]}/callback"
      klass = request.scheme == 'https' ? URI::HTTPS : URI::HTTP
      redirect_route = klass.build(host: request.host, port: request.port, path: path).to_s
      session['dta.omniauth.auth'] = request.env['omniauth.auth'].except('extra')
      session['dta.omniauth.params'] = request.env['omniauth.params']
      redirect_to redirect_route
    end
  end
  # rubocop:enable AbcSize
end
# rubocop:enable AbcSize