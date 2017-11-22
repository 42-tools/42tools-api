class V1::CoalitionsUsersController < ApplicationController
  before_action :set_coalitions_user, only: %i(show)

  # GET /coalitions_users
  def index
    @coalitions_users = CoalitionsUser.all

    render json: @coalitions_users
  end

  # GET /coalitions_users/1
  def show
    render json: @coalitions_user
  end

private

  # Use callbacks to share common setup or constraints between actions.
  def set_coalitions_user
    @coalitions_user = CoalitionsUser.find(params[:id])
  end
end
