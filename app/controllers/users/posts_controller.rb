class Users::PostsController < ApplicationController
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to root_path
  end

  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.includes(:comments).order(created_at: :desc)
  end

  def show
    @user = User.find { |user| user.id == params[:user_id].to_i }
    @post = Post.find { |post| ((post.id == params[:id].to_i) && (post.author_id == params[:user_id].to_i)) }
  end

  def new
    @post = Post.new
    @user = current_user
  end

  def create
    @post = Post.new(post_params)
    @post.author = current_user

    if @post.save
      redirect_to user_posts_path(user_id: params[:user_id].to_i)
    else
      render 'new'
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
