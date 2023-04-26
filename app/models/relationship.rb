class Relationship < ApplicationRecord
  belongs_to :follower, class_name: 'User'
  belongs_to :followee, class_name: 'User'

  validates :follower_id, uniqueness: {scope: :followee_id}
  #validates :followee_id, presence: true
  validate :not_following_self

  private

  def not_following_self
    errors.add(:follower_id, "can't be same as followee_id") if follower_id ==followee_id
  end

end
