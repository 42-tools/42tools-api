class V1::AppsTokensController < ApplicationController
  before_action :set_apps_token, only: %i(show)

  # GET /apps_tokens
  def index
    @apps_tokens = paginate(apps_tokens)
  end

  # GET /apps_tokens/1
  def show
  end

private
  # Use callbacks to share common setup or constraints between actions.
  def set_apps_token
    @apps_token = apps_tokens.find(params[:id])
  end

  def apps_tokens
    (current_user || current_app).apps_tokens
  end
end
