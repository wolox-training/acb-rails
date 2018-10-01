require 'rails_helper'
describe Book, type: :model do
  let(:books) { create(:book) }
  it 'has a gender' do
    is_expected.to validate_presence_of(:gender)
  end
  it 'has a author' do
    is_expected.to validate_presence_of(:author)
  end
  it 'has a title' do
    is_expected.to validate_presence_of(:title)
  end
  it 'has a publisher' do
    is_expected.to validate_presence_of(:publisher)
  end
  it 'has a release_date' do
    is_expected.to validate_presence_of(:release_date)
  end
end
