module V1
  class BacklogsController < ApplicationController
    before_action :set_backlog, only: %i[show update destroy]

    def index
      @backlogs = Backlog.all
      render json: @backlogs
    end

    def show
      render json: @backlog
    end

    def create
      @backlog =  Backlog.new(backlog_params)

      if @backlog.save
        render json: @backlog, status: :created
      else
        render json: @backlog.errors, status: :unprocessable_entity
      end
    end

    def update
      if @backlog.update(backlog_params)
        render json: @backlog
      else
        render json: @backlog.errors, status: :unprocessable_entity
      end
    end

    def destroy
      @backlog.destroy
    end

    private


    def backlog_params
      params.require(:backlog).permit(:name)
    end

    def set_backlog
      @backlog = Backlog.find(params[:id])
    end
  end
end
