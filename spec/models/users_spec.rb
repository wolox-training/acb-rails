require 'rails_helper'
describe User, type: :model do
  let(:user) { create(:user) }
  it 'has a first name' do
    is_expected.to validate_presence_of(:first_name)
  end
  it 'has a last name' do
    is_expected.to validate_presence_of(:last_name)
  end
  describe '#create' do
    context 'When the first_name is nil' do
      let(:first_name) { nil }
      it 'sets the user status' do
        is_expected.to be_invalid
      end
    end
    context 'When the last_name is nil' do
      let(:last_name) { nil }
      it 'sets the user status' do
        is_expected.to be_invalid
      end
    end
  end
end
