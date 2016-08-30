class Score < ApplicationRecord
  belongs_to :user
  belongs_to :backlog
  belongs_to :story

  validates :value, :user_id, :backlog_id, :story_id, presence: true
end
