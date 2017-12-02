class V1::GroupsController < ApplicationController
  before_action :set_group, only: %i(show)

  # GET /groups
  def index
    @groups = Group.all

    paginate json: @groups
  end

  # GET /groups/1
  def show
    render json: @group
  end

private

  # Use callbacks to share common setup or constraints between actions.
  def set_group
    @group = Group.find(params[:id])
  end
end
