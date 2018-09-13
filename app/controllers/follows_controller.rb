class FollowsController < ApplicationController

  def create
    user = User.find(params[:followed_id])
    current_user.follow(user)
    flash[:success] = 'ユーザをフォローしました。'
    redirect_to :back
  end

  def destroy
    user = User.find(params[:followed_id])
    current_user.unfollow(user)
    flash[:success] = 'ユーザのフォローを解除しました。'
    redirect_to :back
  end

end
