module Api
  module V1
    class RentsController < ApplicationController
      include Wor::Paginate

      def index
        @rents = Rent.includes(:book, :user).where( {:user_id=>params[:id]} )
        render_paginated @rents
      end

      def create
        rent = Rent.new(rent_params)
         if rent.save
           render json: rent
         else
           render json: rent.errors, status: :unprocessable_entity
         end
       end

      private

      def rent_params
       params.permit(:user_id, :book_id, :from, :to)
      end

    end
  end
end
