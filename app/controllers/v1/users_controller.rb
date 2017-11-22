class V1::UsersController < ApplicationController
  before_action :set_user, only: %i(show)

  # GET /users
  def index
    @users = User.all

    render json: @users
  end

  # GET /users/1
  def show
    render json: @user
  end

private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find_by(id: params[:id])

    render json: {
      error: 'record not found'
    }, status: :not_found unless @user
  end
end
