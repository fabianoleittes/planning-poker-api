module V1
  class ScoresController < ApplicationController
    def create
      @backlog = Backlog.find(params[:backlog_id])
      @story   = Story.find(params[:story_id])

      @score   = Score.new(score_params)


      @score.backlog = @backlog
      @score.story   = @story

      # @score = CreateScore.process(params[:value],params[:user_id],params[:backlog_id],params[:story_id])

      if @score.save
        render json: @score, status: :created
      else
        render json: @score.errors, status: :unprocessable_entity
      end
    end

    private

    def score_params
      params.require(:score).permit(:value, :backlog_id, :story_id, :user_id)
    end
  end
end
