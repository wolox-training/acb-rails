require 'rails_helper'

describe BookSuggestion, type: :model do
  let(:book_suggestion) { create(:book_suggestion) }

  it 'has a title' do
    is_expected.to validate_presence_of(:title)
  end
  it 'has a author' do
    is_expected.to validate_presence_of(:author)
  end
  it 'has a year' do
    is_expected.to validate_presence_of(:year)
  end
  it 'has a publisher' do
    is_expected.to validate_presence_of(:publisher)
  end
  it 'has a link' do
    is_expected.to validate_presence_of(:link)
  end
end
