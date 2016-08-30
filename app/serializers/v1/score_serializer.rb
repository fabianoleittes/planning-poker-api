module V1
  class ScoreSerializer < ActiveModel::Serializer
    attributes :id, :value, :user_id, :backlog_id, :story_id
    belongs_to :user
    belongs_to :backlog
    belongs_to :story
  end
end
