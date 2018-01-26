class V1::CursusUsersController < ApplicationController
  before_action :set_cursus_user, only: %i(show)

  # GET /cursus_users
  def index
    @cursus_users = paginate(FortyTwo::CursusUser.all)
  end

  # GET /cursus_users/1
  def show
  end

private

  # Use callbacks to share common setup or constraints between actions.
  def set_cursus_user
    @cursus_user = FortyTwo::CursusUser.find(params[:id])
  end
end
