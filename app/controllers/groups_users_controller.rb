class GroupsUsersController < ApplicationController
  before_action :set_groups_user, only: %i(:show)

  # GET /groups_users
  def index
    @groups_users = GroupsUser.all

    render json: @groups_users
  end

  # GET /groups_users/1
  def show
    render json: @groups_user
  end

private

  # Use callbacks to share common setup or constraints between actions.
  def set_groups_user
    @groups_user = GroupsUser.find(params[:id])
  end
end
