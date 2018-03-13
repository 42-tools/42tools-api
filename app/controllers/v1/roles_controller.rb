class V2::RolesController < ApplicationController
  before_action :set_role, only: %i(show)

  # GET /forty_two/roles
  def index
    @forty_two_roles = paginate(FortyTwo::Role.all)
  end

  # GET /forty_two/roles/1
  def show
  end

private

  # Use callbacks to share common setup or constraints between actions.
  def set_role
    @forty_two_role = FortyTwo::Role.find(params[:id])
  end
end
