class Story < ApplicationRecord
  belongs_to :backlog
  has_many :scores

  validates :description, presence: true
end
