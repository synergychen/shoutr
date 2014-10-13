class FollowingRelationshipsController < ApplicationController
  def create
    following_relationship = FollowingRelationship.new(
      follower_id: current_user.id,
      followed_user_id: params[:user_id]
    )
    following_relationship.save
    redirect_to shouts_path
  end
end
