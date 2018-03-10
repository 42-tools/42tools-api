class V1::LanguagesController < ApplicationController
  before_action :set_language, only: %i(show)

  # GET /languages
  def index
    @languages = paginate(FortyTwo::Language.all)
  end

  # GET /languages/1
  def show
  end

private

  # Use callbacks to share common setup or constraints between actions.
  def set_language
    @language = FortyTwo::Language.find(params[:id])
  end
end
