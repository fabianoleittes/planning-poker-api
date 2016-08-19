module V1
  class StorySerializer < ActiveModel::Serializer
    attributes :id, :description
    belongs_to :backlog
  end
end
