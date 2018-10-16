# frozen_string_literal: true

module Api
    class SessionController < ApiController
      def create
  	     #@user = User.find_or_create_from_auth_hash(env["omniauth.auth"])
  	     #session[:user_id] = @user.id
         #redirect_to root_path
         user = User.from_omniauth(env["omniauth.auth"])
         session[:user_id] = user.id
         redirect_to root_path
      end

      def destroy
        session[:user_id] = nil
        redirect_to root_path
      end
    end

end
