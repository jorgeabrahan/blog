require 'rails_helper'

RSpec.describe 'Users::Posts', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/users/posts/index'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      get '/users/posts/show'
      expect(response).to have_http_status(:success)
    end
  end
end
