class User < ApplicationRecord
has_many :items
has_many :active_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destory
has_many :passive_relationships, class_name: "Relationship", foreign_key: "followed_id",
dependent: :destroy

has_many: following, through: :active_relationships, source: :followed
has_many :followers, through: :passive_relationships, source: :follower

has_secure_password
validates :email, presence: true, uniqueness: true
end

#follow a user

def follow(other_user)
  active_relationships.create(follow_id: other_user)
end

def unfollow(other_user)
  active_relationships.find_by(follow_id: other_user).destory
end

def following?(other_user)
  following.include(other_user)
end

