require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'GET /users' do
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /users/:id' do
    it 'returns http success' do
      get :show, params: { id: 1 }
      expect(response).to have_http_status(:success)
    end
  end
end
