class V1::UsersController < ApplicationController
  before_action :set_user, only: %i(show)

  # GET /users
  def index
    @users = paginate(FortyTwo::User.all)
  end

  # GET /users/1
  def show
  end

private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = FortyTwo::User.find(params[:id])
  end
end
