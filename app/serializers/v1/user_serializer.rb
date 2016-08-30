module V1
  class UserSerializer < ActiveModel::Serializer
    attributes :id, :full_name, :email, :kind
  end
end
