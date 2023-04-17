class SleepRecord < ApplicationRecord
  belongs_to :user

  def duration
    end_time - start_time
  end
end
