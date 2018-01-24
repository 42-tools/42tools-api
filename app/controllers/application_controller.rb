class ApplicationController < ActionController::API
  before_action :authenticate_app!

  include CustomErrorsConcern

private

  def apps_token
    data = Bearer.decode(request.headers['Authorization'])

    return unless data

    AppsToken.find_by_id(data['app_token_id'])
  end

  def current_app
    apps_token&.app
  end

  def current_user
    apps_token&.user
  end

  def authenticate_app!
    render json: {
      error: 'Invalid authentication credentials'
    }, status: :unauthorized unless current_app
  end

  def authenticate_user!
    render json: {
      error: 'Invalid authentication credentials'
    }, status: :unauthorized unless current_user
  end
end
