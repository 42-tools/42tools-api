class V1::GroupsUsersController < ApplicationController
  before_action :set_groups_user, only: %i(show)

  # GET /groups_users
  def index
    @groups_users = paginate(FortyTwo::GroupsUser.all)
  end

  # GET /groups_users/1
  def show
  end

private

  # Use callbacks to share common setup or constraints between actions.
  def set_groups_user
    @groups_user = FortyTwo::GroupsUser.find(params[:id])
  end
end
