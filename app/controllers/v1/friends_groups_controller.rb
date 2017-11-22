class V1::FriendsGroupsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_friends_group, only: %i(show update destroy)

  # GET /friends_groups
  def index
    @friends_groups = current_user.friends_groups
  end

  # GET /friends_groups/1
  def show
  end

  # POST /friends_groups
  def create
    @friends_group = current_user.friends_groups.new(friends_group_params)

    if @friends_group.save
      render :show, status: :created, location: v1_friends_group_url(@friends_group)
    else
      render json: @friends_group.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /friends_groups/1
  def update
    if @friends_group.update(friends_group_params)
      render :show
    else
      render json: @friends_group.errors, status: :unprocessable_entity
    end
  end

  # DELETE /friends_groups/1
  def destroy
    @friends_group.destroy
  end

private

  # Use callbacks to share common setup or constraints between actions.
  def set_friends_group
    @friends_group = current_user.friends_groups.find(id: params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def friends_group_params
    params.permit(:name)
  end
end
