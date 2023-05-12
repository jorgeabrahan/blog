class Users::Posts::LikesController < ApplicationController
  def create
    @like = Like.new
    @like.author = current_user
    @like.post = Post.find { |post| post.id == params[:post_id].to_i }
    
    if @like.save
      redirect_to user_post_path(user_id: params[:user_id].to_i, id: params[:post_id].to_i)
    end

  end
end
