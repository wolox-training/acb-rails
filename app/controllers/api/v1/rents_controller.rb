module Api
  module V1
    class RentsController < ApplicationController
      include Wor::Paginate
      def index
        render_paginated current_user.rents
      end

      def create
        Book.find(create_params['book_id'])
        rent = Rent.new(create_params)
        render json: rent
      end

      private

      def create_params
        params.permit(:user_id, :book_id, :from, :to)
      end

      def index_params
        params.required(:user_id)
      end
    end
  end
end
