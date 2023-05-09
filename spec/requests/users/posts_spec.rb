require 'rails_helper'

RSpec.describe Users::PostsController, type: :controller do
  describe "GET /users/:user_id/posts" do
    it "returns http success" do
      get :index, params: { user_id: 1 }
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /users/:user_id/posts/:id" do
    it "returns http success" do
      get :show, params: { user_id: 1, id: 1 }
      expect(response).to have_http_status(:success)
    end
  end
end
