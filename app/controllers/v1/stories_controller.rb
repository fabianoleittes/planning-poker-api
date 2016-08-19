module V1
  class StoriesController < ApplicationController
    before_action :set_story, only: %i[update destroy]

    def create
      @backlog = Backlog.find(params[:backlog_id])

      @story = Story.new(story_params)

      @story.backlog = @backlog

      if @story.save
        render json: @story, status: :created
      else
        render json: @story.errors, status: :unprocessable_entity
      end
    end

    def update
      if @story.update(story_params)
        render json: @story, status: :ok
      else
        render json: @story.errors, status: :unprocessable_entity
      end
    end

    def destroy
      @story.destroy
      render json: :none, status: :no_content
    end

    private

    def story_params
      params.require(:story).permit(:description, :backlog_id)
    end

    def set_story
      @story = Story.find(params[:id])
    end
  end
end
