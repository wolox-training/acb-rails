require 'rails_helper'
describe AdminUser, type: :model do
  let(:admin_user) { create(:admin_user) }

  it 'has a email' do
    is_expected.to validate_presence_of(:email)
  end
  describe '#create' do
    context 'When the email is nil' do
      let(:email) { nil }
      it 'sets the user status' do
        is_expected.to be_invalid
      end
    end
  end
end
