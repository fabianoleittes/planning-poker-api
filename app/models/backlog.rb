class Backlog < ApplicationRecord
  validates :name, presence: true
  has_many :stories
end
