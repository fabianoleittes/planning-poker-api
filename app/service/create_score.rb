class CreateScore
  include ActiveModel::Model

  attr_reader :value, :user_id, :backlog_id, :story_id

  def initialize(value:, user_id:, backlog_id:, story_id:)
    @value, @user_id, @backlog_id, @story_id = value, user_id, backlog_id, story_id
  end

  def self.process(value, user_id, backlog_id, story_id)
    new(value: value, user_id: user_id, backlog_id: backlog_id, story_id: story_id).tap(&:process)
  end

  def process
    build_score
  end

  def user
    @user ||= User.find_by(id: user_id)
  end

  def backlog
    @backlog ||= Backlog.find_by(id: backlog_id)
  end

  def story
    @story ||= Story.find_by(id: story_id)
  end

  def build_score
    @score ||= Score.create(
      value: value,
      user_id: user.id,
      backlog_id: backlog.id,
      story_id: story.id
    )
  end
end
