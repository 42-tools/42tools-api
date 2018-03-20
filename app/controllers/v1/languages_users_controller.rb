class V1::LanguagesUsersController < ApplicationController
  before_action :set_languages_user, only: %i(show)

  # GET /languages_user
  def index
    @languages_users = paginate(FortyTwo::LanguagesUser.all)
  end

  # GET /languages_user/1
  def show
  end

private

  # Use callbacks to share common setup or constraints between actions.
  def set_languages_user
    @languages_user = FortyTwo::LanguagesUser.find(params[:id])
  end
end
