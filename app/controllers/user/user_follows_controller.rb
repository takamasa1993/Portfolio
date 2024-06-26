class User::UserFollowsController < ApplicationController
  before_action :authenticate_user!

  def create
    user = User.find(params[:id])
    current_user.follow(user)
    redirect_back(fallback_location: root_path, notice: 'フォローしました。')
  end

  def destroy
    user = User.find(params[:id])
    current_user.unfollow(user)
    redirect_back(fallback_location: root_path, notice: 'フォローを解除しました。')
  end
end