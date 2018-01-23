class V1::AppsController < ApplicationController
  before_action :set_app, only: %i(show)

  # GET /apps
  def index
    @apps = paginate(App.all)
  end

  # GET /apps/1
  def show
  end

private
  # Use callbacks to share common setup or constraints between actions.
  def set_app
    @app = App.find(params[:id])
  end
end
