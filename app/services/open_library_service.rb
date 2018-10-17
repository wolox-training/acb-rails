class OpenLibraryService
    include HTTParty
  
    base_uri 'https://openlibrary.org/api/books'
    default_params format: 'json', jscmd: 'data'
    format :json
  
    def self.book_info(isbn)
      response = get(base_uri, query: { bibkeys: isbn })
      if !response.nil?
        cleanup(response.parsed_response[isbn], isbn)
      else
        message[:error] = 'No response from Open Library'
      end
    end
  
    def self.cleanup(res, isbn)
      json = {}
      json[:ISBN] = isbn
      json[:title] = res['title']
      json[:subtitle] = res['subtitle']
      json[:number_of_pages] = res['number_of_pages']
      json[:authors] = res['authors']
      json
    end
end