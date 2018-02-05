class V1::TitlesController < ApplicationController
  before_action :set_title, only: [:show]

  # GET /titles
  # GET /titles.json
  def index
    @titles = paginate(FortyTwo::Title.all)
  end

  # GET /titles/1
  # GET /titles/1.json
  def show
  end

private

  # Use callbacks to share common setup or constraints between actions.
  def set_title
    @title = FortyTwo::Title.find(params[:id])
  end
end
