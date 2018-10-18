# frozen_string_literal: true

module Api
  module V1
    class OpenLibraryController < ApiController
      skip_before_action :authenticate_user!, only: [:show]
      def show
        render json: OpenLibraryService.new.book_info(params[:id])
      rescue JSON::ParserError, TypeError
        'JSON TypeError'
      rescue NoMethodError
        'Book not found'
      rescue SocketError
        'Error 404'
      end
    end
  end
end
