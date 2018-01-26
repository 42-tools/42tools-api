class V1::CursusController < ApplicationController
  before_action :set_cursu, only: %i(show)

  # GET /cursus
  def index
    @cursus = paginate(FortyTwo::Cursus.all)
  end

  # GET /cursus/1
  def show
  end

private

  # Use callbacks to share common setup or constraints between actions.
  def set_cursus
    @cursus = FortyTwo::Cursus.find(params[:id])
  end
end
