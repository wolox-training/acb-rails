# frozen_string_literal: true

module Api
  module V1
    class OpenLibraryController < ApiController
      def show
        render json: OpenLibraryService.book_info(params[:id])
      end
    end
  end
end