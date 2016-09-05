module V1
  class BacklogsController < ApplicationController
    before_action :set_backlog, only: %i[show update destroy]

    def index
      @backlogs = Backlog.all
      render jsonapi: @backlogs
    end

    def show
      render jsonapi: @backlog
    end

    def create
      @backlog =  Backlog.new(backlog_params)

      if @backlog.save
        render jsonapi: @backlog, status: :created
      else
        render jsonapi: @backlog.errors, status: :unprocessable_entity
      end
    end

    def update
      if @backlog.update(backlog_params)
        render jsonapi: @backlog
      else
        render jsonapi: @backlog.errors, status: :unprocessable_entity
      end
    end

    def destroy
      @backlog.destroy
    end

    private


    def backlog_params
      params.require(:backlog).permit(:name, :user_id)
    end

    def set_backlog
      @backlog = Backlog.find(params[:id])
    end
  end
end
