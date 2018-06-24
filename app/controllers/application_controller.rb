class ApplicationController < ActionController::API
  before_action :authenticate_app!

  include CustomErrorsConcern

private

  def app_token
    data = Bearer.decode(request.headers['Authorization'])

    return unless data

    Token.find_by_id(data['app_token_id'])
  end

  def current_app
    app_token&.app
  end

  def current_user
    app_token&.user
  end

  def authenticate_app!
    render json: {
      error: 'invalid authentication credentials'
    }, status: :unauthorized unless current_app
  end

  def authenticate_user!
    render json: {
      error: 'invalid authentication credentials'
    }, status: :unauthorized unless current_user
  end

  def local_app!
    render json: {
      error: 'forbidden'
    }, status: :forbidden unless current_app.local?
  end

  def owner_app!
    render json: {
      error: 'forbidden'
    }, status: :forbidden if !current_user || current_app.owner == current_user
  end
end
