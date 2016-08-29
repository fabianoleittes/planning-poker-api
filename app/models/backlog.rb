class Backlog < ApplicationRecord
  validates :name, :user_id, presence: true
  has_many :stories
  belongs_to :user
end
