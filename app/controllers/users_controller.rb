class UsersController < ApplicationController
  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def profile
    user = User.find(params[:id])
    @name = user.name
    @note33_id = user.note33_id
    @self_introduction = user.self_introduction

    # @tweets = user.tweets.page(params[:page]).per(5).order("created_at DESC")
  end

  def show
    @user = User.find(params[:id])
    @name = @user.name
    @note33_id = @user.note33_id
  end

  def following
    @user  = User.find(params[:id])
    @users = @user.following
  end

  def followers
    @user  = User.find(params[:id])
    @users = @user.followers
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :note33_id, :header_image, :avatar_image, :self_introduction)
  end

end
