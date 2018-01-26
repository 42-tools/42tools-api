class V1::CoalitionsController < ApplicationController
  before_action :set_coalition, only: %i(show)

  # GET /coalitions
  def index
    @coalitions = paginate(FortyTwo::Coalition.all)
  end

  # GET /coalitions/1
  def show
  end

private

  # Use callbacks to share common setup or constraints between actions.
  def set_coalition
    @coalition = FortyTwo::Coalition.find(params[:id])
  end
end
