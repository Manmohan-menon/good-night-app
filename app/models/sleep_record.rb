class SleepRecord < ApplicationRecord
  belongs_to :user

  validates :start_time, presence: true
  validates :end_time, presence: true

  def duration
    end_time - start_time
  end
end
