class CursusUsersController < ApplicationController
  before_action :set_cursus_user, only: %i(:show)

  # GET /cursus_users
  def index
    @cursus_users = CursusUser.all

    render json: @cursus_users
  end

  # GET /cursus_users/1
  def show
    render json: @cursus_user
  end

private

  # Use callbacks to share common setup or constraints between actions.
  def set_cursus_user
    @cursus_user = CursusUser.find(params[:id])
  end
end
