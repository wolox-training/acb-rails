require 'rails_helper'
require 'support/shared_contexts/authenticated_user.rb'
describe Api::V1::BookSuggestionsController, type: :controller do
  include_context 'Authenticated User'
  describe 'POST #create' do
    context 'When creating a valid book suggestion' do
      let(:user) { create(:user)}
      let!(:book_suggestion_attributes) { attributes_for(:book_suggestion)}
      before do
        request.headers.merge! user.create_new_auth_token
        post :create, params: { book_suggestion: book_suggestion_attributes }
      end
      it 'creates a new book suggestion' do
        request  = JSON.parse(response.body)
        expect(request['user_id']).to eq user.id
      end
      it 'responds with 200 status' do
        expect(response).to have_http_status(:created)
      end
    end
  end


  
end
