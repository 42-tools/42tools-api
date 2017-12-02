class V1::CampusController < ApplicationController
  before_action :set_campus, only: %i(show)

  # GET /campus
  def index
    @campus = Campus.all

    paginate json: @campus
  end

  # GET /campus/1
  def show
    render json: @campus
  end

private

  # Use callbacks to share common setup or constraints between actions.
  def set_campus
    @campus = Campus.find(params[:id])
  end
end
