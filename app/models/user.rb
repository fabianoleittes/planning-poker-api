class User < ApplicationRecord
  validates :full_name, :email, :kind, presence: true
  has_many :backlogs
end
