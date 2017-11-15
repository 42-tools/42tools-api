class ApplicationController < ActionController::API
  before_action :authenticate_app!
  before_action :request_logger

private

  def apps_token
    authorization = request.headers['Authorization']

    return if authorization.blank?

    type, credentials = authorization.split(' ')

    return if type != 'Bearer'

    data = JsonWebToken.decode(credentials)&.first

    return if data.nil?

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
    }, status: :unauthorized if current_app.nil?
  end

  def authenticate_user!
    render json: {
      error: 'Invalid authentication credentials'
    }, status: :unauthorized if current_user.nil?
  end

  def request_logger
    return if params[:controller].match(%r(/auths$))

    apps_token.logs.create!(data: {
      controller: params[:controller],
      action: params[:action],
      params: params.reject { |k, v| k.in?(%w(controller action)) }.as_json
    })
  end
end
