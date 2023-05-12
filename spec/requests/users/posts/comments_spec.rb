require 'rails_helper'

RSpec.describe "Users::Posts::Comments", type: :request do
  describe "GET /new" do
    it "returns http success" do
      get "/users/posts/comments/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/users/posts/comments/create"
      expect(response).to have_http_status(:success)
    end
  end

end
