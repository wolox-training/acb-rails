# frozen_string_literal: true

module Api
  module V1
    class SessionController < ApiController
      def create
  	     @user = User.find_or_create_from_auth_hash(env["omniauth.auth"])
  	     session[:user_id] = @user.id
  	     redirect_to :me
      end
    end
  end
end
