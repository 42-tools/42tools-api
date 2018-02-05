class V1::TitlesUsersController < ApplicationController
  before_action :set_titles_user, only: [:show]

  # GET /titles_users
  # GET /titles_users.json
  def index
    @titles_users = paginate(FortyTwo::TitlesUser.all)
  end

  # GET /titles_users/1
  # GET /titles_users/1.json
  def show
  end

private

  # Use callbacks to share common setup or constraints between actions.
  def set_titles_user
    @titles_user = FortyTwo::TitlesUser.find(params[:id])
  end
end
