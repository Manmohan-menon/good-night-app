class User < ApplicationRecord
  has_many :sleep_records, dependent: :destroy
  has_many :followee_relationships, class_name: 'Relationship', foreign_key: 'follower_id', dependent: :destroy
  has_many :follower_relationships, class_name: 'Relationship', foreign_key: 'followee_id', dependent: :destroy
  has_many :followees, through: :followee_relationships, source: :followee
  has_many :followers, through: :follower_relationships, source: :follower

  validates :name, presence: true

  def self.clocked_in_times
    SleepRecord.select(:start_time).order(created_at: :desc)
  end

  def friends_sleep_records
    SleepRecord.where(user_id: followees.pluck(:id)).where('end_time >= ?', 1.week.ago).order(Arel.sql('end_time - start_time DESC'))
  end
end
