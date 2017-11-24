module CustomErrorsConcern
  extend ActiveSupport::Concern

  included do
    skip_before_action :authenticate_app!, only: %i(route_not_found)
    skip_before_action :request_logger, only: %i(route_not_found)

    rescue_from Exception, with: :internal_server_error
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  end

  def route_not_found
    render json: {
      error: 'route not found'
    }, status: :not_found
  end

private

  def record_not_found
    render json: {
      error: 'record not found'
    }, status: :not_found
  end

  def internal_server_error(e)
    error_info = {
      error: 'internal server error'
    }

    if Rails.env.development?
      error_info[:exception] = "#{e.class.name} : #{e.message}"
      error_info[:trace] = e.backtrace[0, 10]
    end

    render json: error_info, status: :internal_server_error
  end
end
