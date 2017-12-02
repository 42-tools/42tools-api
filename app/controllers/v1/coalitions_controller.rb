class V1::CoalitionsController < ApplicationController
  before_action :set_coalition, only: %i(show)

  # GET /coalitions
  def index
    @coalitions = Coalition.all

    paginate json: @coalitions
  end

  # GET /coalitions/1
  def show
    render json: @coalition
  end

private

  # Use callbacks to share common setup or constraints between actions.
  def set_coalition
    @coalition = Coalition.find(params[:id])
  end
end
