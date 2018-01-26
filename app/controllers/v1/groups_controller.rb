class V1::GroupsController < ApplicationController
  before_action :set_group, only: %i(show)

  # GET /groups
  def index
    @groups = paginate(FortyTwo::Group.all)
  end

  # GET /groups/1
  def show
  end

private

  # Use callbacks to share common setup or constraints between actions.
  def set_group
    @group = FortyTwo::Group.find(params[:id])
  end
end
