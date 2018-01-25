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
      error: 'invalid authentication credentials'
    }, status: :unauthorized unless current_app
  end

  def authenticate_user!
    render json: {
      error: 'invalid authentication credentials'
    }, status: :unauthorized unless current_user
  end

  AppsRole.slugs.keys.each do |slug|
    class_eval <<-METHODS, __FILE__, __LINE__ + 1
      def require_app_#{slug}!
        render json: {
          error: 'forbidden'
        }, status: :forbidden unless current_app.#{slug}?
      end
    METHODS
  end
end
