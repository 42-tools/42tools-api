class V1::LogsController < ApplicationController
  before_action :set_log, only: [:show]

  # GET /logs
  def index
    @logs = Log.all

    render json: @logs
  end

  # GET /logs/1
  def show
    render json: @log
  end

private

  # Use callbacks to share common setup or constraints between actions.
  def set_log
    @log = Log.find(params[:id])
  end
end
