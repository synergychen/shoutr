class User < ActiveRecord::Base
  has_many :shouts

  has_many :followed_user_relationships,
    foreign_key: :follower_id,
    class_name: "FollowingRelationship"

  has_many :followed_users, through: :followed_user_relationships

  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true

  def following?(other_user)
    followed_users.include?(other_user)
  end
end
