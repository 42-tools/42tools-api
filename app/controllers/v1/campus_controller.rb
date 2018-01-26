class V1::CampusController < ApplicationController
  before_action :set_campus, only: %i(show)

  # GET /campus
  def index
    @campus = paginate(FortyTwo::Campus.all)
  end

  # GET /campus/1
  def show
  end

private

  # Use callbacks to share common setup or constraints between actions.
  def set_campus
    @campus = FortyTwo::Campus.find(params[:id])
  end
end
