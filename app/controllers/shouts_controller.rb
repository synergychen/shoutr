class ShoutsController < ApplicationController
  before_action :require_login

  def index
    @shout = Shout.new
    @shouts = Shout.all
    @users = User.all
    @following_relationship = FollowingRelationship.new
    @users_i_followed = current_user.followed_users
    @users_i_not_followed = User.where.not(id: current_user.followed_user_ids)
  end

  def create
    current_user.shouts.create(shout_params)
    redirect_to shouts_path
  end

  private

  def shout_params
    params.require(:shout).permit(:body)
  end
end
