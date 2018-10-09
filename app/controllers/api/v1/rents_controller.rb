module Api
  module V1
    class RentsController < ApiController
      rescue_from Pundit::NotAuthorizedError, with: :pundit_not_authorized_error
      include Wor::Paginate

      def index
        @rents = Rent.includes(:book, :user).where(user_id: params[:id])
        @user  = User.find(params[:user_id])
        authorize(@user)
        render_paginated @rents
      end

      def create
        @rent = Rent.new(rent_params)
        @user = User.find(params[:user_id])
        authorize(@user)
        if @rent.save
          render json: @rent, status: :created
          EmailWorker.perform_async(@rent.id)
        else
          render json: @rent.errors, status: :unprocessable_entity
        end
      end

      private

      def rent_params
        params.permit(:user_id, :book_id, :from, :to)
      end

      def pundit_not_authorized_error
        render json: { errors: I18n.t('errores.pundit.notallow')}, status: :unauthorized
      end
    end
  end
end
