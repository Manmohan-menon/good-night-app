class Relationship < ApplicationRecord
  belongs_to :follower
  belongs_to :followee
end
