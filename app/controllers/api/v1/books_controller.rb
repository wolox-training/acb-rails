module Api
  module V1
    class BooksController < ApplicationController
      include Wor::Paginate

      def index
        @books = Book.all
        render_paginated @books
      end

      def show
        @book = Book.find(params[:id])
        render json: @book
      end
    end
  end
end
