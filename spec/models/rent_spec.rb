require 'rails_helper'
describe Rent, type: :model do
  let(:rents) { create(:rent) }
  it 'has a initial date' do
    is_expected.to validate_presence_of(:from)
  end
  it 'has an end date' do
    is_expected.to validate_presence_of(:to)
  end
  it 'has a Book id' do
    is_expected.to validate_presence_of(:book)
  end
  it 'has a User id' do
    is_expected.to validate_presence_of(:user)
  end
end
