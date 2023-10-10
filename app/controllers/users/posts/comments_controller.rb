class Users::Posts::CommentsController < ApplicationController
  def new
    @comment = Comment.new
    @post = Post.find { |post| post.id == params[:post_id].to_i }
    @user = current_user
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.author = current_user
    @comment.post = Post.find { |post| post.id == params[:post_id].to_i }

    if @comment.save
      redirect_to user_post_path(user_id: params[:user_id].to_i, id: params[:post_id].to_i)
    else
      render 'new'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to user_post_path(@comment.post.author, @comment.post), notice: 'Comment was successfully deleted.'
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
