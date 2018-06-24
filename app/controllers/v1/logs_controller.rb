class V1::LogsController < ApplicationController
  before_action :set_log, only: %i(show)

  # GET /logs
  def index
    @logs = paginate(logs)
  end

  # GET /logs/1
  def show
  end

private

  # Use callbacks to share common setup or constraints between actions.
  def set_log
    @log = logs.find(params[:id])
  end

  def logs
    (current_app.local? ? current_user || current_app : app_token).logs
  end
end
