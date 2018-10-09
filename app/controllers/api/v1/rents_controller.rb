module Api
  module V1
    class RentsController < ApiController
      include Wor::Paginate

      def index
        render_paginated(policy_scope(Rent))
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
    end
  end
end
