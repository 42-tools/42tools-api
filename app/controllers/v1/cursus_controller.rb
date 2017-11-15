class V1::CursusController < ApplicationController
  before_action :set_cursu, only: %i(:show)

  # GET /cursus
  def index
    @cursus = Cursus.all

    render json: @cursus
  end

  # GET /cursus/1
  def show
    render json: @cursus
  end

private

  # Use callbacks to share common setup or constraints between actions.
  def set_cursus
    @cursus = Cursus.find(params[:id])
  end
end
