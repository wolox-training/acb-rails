# frozen_string_literal: true
  class SessionsController < ActionController::Base
    def create
      user = User.from_omniauth(request.env["omniauth.auth"])
      session[:user_id] = user.id
      byebug
      redirect_to ('/')
    end

    def destroy
      session[:user_id] = nil
      redirect_to ('/')
    end
  end
