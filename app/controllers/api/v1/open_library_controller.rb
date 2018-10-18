# frozen_string_literal: true

module Api
  module V1
    class OpenLibraryController < ApiController
      skip_before_action :authenticate_user!, only: [:show]
      def show
        return render json: OpenLibraryService.new.book_info(params[:id])
      rescue JSON::ParserError, TypeError => e
        return 'JSON TypeError'
      rescue NoMethodError
        return "Book not found"
      rescue SocketError
        return 'Error 404'
      end
    end
  end
end