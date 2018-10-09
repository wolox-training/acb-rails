module Api
  module V1
    class RentsController < ApiController
      rescue_from Pundit::NotAuthorizedError, with: :pundit_not_authorized_error
      include Wor::Paginate

      def index
        render_paginate @rents = policy_scope(Rent)
      end

      def create
        @rent = Rent.new(rent_params)
        @user = current_user
        authorize(@rent)
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
        render json: { errors: I18n.t('errores.pundit.notallow') }, status: :unauthorized
      end
    end
  end
end
