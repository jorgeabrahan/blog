class UsersController < ApplicationController
  def index
    @users = User.all
  end
  
  def show
    @user = User.find { |user| user.id == params[:id].to_i }
  end
end
