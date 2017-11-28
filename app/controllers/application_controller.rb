class ApplicationController < ActionController::API
  before_action :authenticate_app!
  before_action :request_logger

  include CustomErrorsConcern

private

  def apps_token
    authorization = request.headers['Authorization']

    return if authorization.blank?

    type, credentials = authorization.split(' ')

    return if type != 'Bearer'

    data = JsonWebToken.decode(credentials)&.first

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

  def request_logger
    return if params[:controller].match(%r(/auths$))

    apps_token.logs.create!(data: {
      controller: params[:controller],
      action: params[:action],
      params: params.reject { |k, v| k.in?(%w(controller action)) }.as_json
    })
  end
end
