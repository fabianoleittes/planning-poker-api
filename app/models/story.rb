class Story < ApplicationRecord
  belongs_to :backlog

  validates :description, presence: true
end
