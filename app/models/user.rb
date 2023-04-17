class User < ApplicationRecord
  has_many :sleep_records, dependent: :destroy
  has_many :followee_relationships, class_name: 'Relationship', foreign_key: 'follower_id', dependent: :destroy
  has_many :follower_relationships, class_name: 'Relationship', foreign_key: 'followee_id', dependent: :destroy
  has_many :followees, through: :followee_relationships
  has_many :followers, through: :follower_relationships
end
