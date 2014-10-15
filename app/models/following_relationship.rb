class FollowingRelationship < ActiveRecord::Base
  belongs_to :followed_user, class_name: "User"
  belongs_to :follower, class_name: "User"

  validate :user_is_not_follow_themself

  def user_is_not_follow_themself
    if follower_id == followed_user_id
      errors.add(:base, "User can't follow themselves")
    end
  end
end
