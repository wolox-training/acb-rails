module Api
  module V1
    class RentsController < ApplicationController
      include Wor::Paginate

      def index
        @rents = Rent.includes(:book, :user).where(user_id: params[:id])
        render_paginated @rents
      end

      def create
        @rent = Rent.new(rent_params)
        if @rent.save
          render json: @rent, status: :created
          #EmailWorker.perform_async(@rent.id)
          #rent_id=Rent.find(@rent_id)
          UserMailer.welcome_email(@rent).deliver_now
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
