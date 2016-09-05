module V1
  class UserSerializer < ActiveModel::Serializer
    attributes :id, :full_name, :email, :kind

    has_many :backlogs
  end
end
