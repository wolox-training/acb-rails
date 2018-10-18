# frozen_string_literal: true

class OpenLibraryService
  include HTTParty
  base_uri 'https://openlibrary.org'

  def book_info(isbn)
    url_isbn = "ISBN:#{isbn}"
    begin
      parsed_response = findbook(url_isbn)
    end
    build_hash(parsed_response, isbn, url_isbn)
  end

  protected

  def build_hash(api_res, isbn, url_isbn)
    {
      isbn: isbn,
      title: api_res[url_isbn]['title'],
      subtitle: api_res[url_isbn]['subtitle'],
      number_of_pages: api_res[url_isbn]['number_of_pages'],
      authors: api_res[url_isbn]['authors']
    }
  end

  def make_header
    { 'Accept' => 'application/json' }
  end

  def make_options(url_isbn)
    { bibkeys: url_isbn, format: 'json', jscmd: 'data' }
  end

  def findbook(url_isbn)
    response = self.class.get('/api/books', query: make_options(url_isbn), headers: make_header)
    JSON.parse(response.body)
  end
end
