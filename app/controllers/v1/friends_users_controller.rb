class V1::FriendsUsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_friends_user, only: %i(show destroy)

  # GET /friends_users
  def index
    @friends_users = paginate(current_user.friends_users)
  end

  # GET /friends_users/1
  def show
  end

  # POST /friends_users
  def create
    friend_id = params.require(:user_id)

    unless FortyTwo::User.exists?(friend_id)
      FriendsUserJob.perform_later(current_user.id, friend_id)

      return render json: {}, status: :processing
    end

    @friends_user = current_user.friends_users.find_or_initialize_by(friend_id: friend_id)
    @friends_user_is_new_record = @friends_user.new_record?

    if @friends_user.save
      render :show, status: @friends_user_is_new_record ? :created : :ok, location: v1_friend_url(@friends_user)
    else
      render json: @friends_user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /friends_users/1
  def destroy
    @friends_user.destroy
  end

private

  # Use callbacks to share common setup or constraints between actions.
  def set_friends_user
    @friends_user = current_user.friends_users.find_by!(friend_id: params[:id])
  end
end
