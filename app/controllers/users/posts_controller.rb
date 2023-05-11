class Users::PostsController < ApplicationController
  def index
    @user = User.find { |user| user.id == params[:user_id].to_i }
  end

  def show
    @user = User.find { |user| user.id == params[:user_id].to_i }
    @post = Post.find { |post| ((post.id == params[:id].to_i) && (post.author_id == params[:user_id].to_i)) }
  end
end
