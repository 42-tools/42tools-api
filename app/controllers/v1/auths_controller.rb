class V1::AuthsController < ApplicationController
  skip_before_action :authenticate_app!

  def create
    begin
      client_credentials = Intra42.new(access_token: params.require(:access_token))
      payload = client_credentials.get('/v2/me')
    rescue Faraday::ConnectionFailed
      return render json: {
        error: 'connection failed to api.intra.42.fr'
      }, status: :gateway_timeout
    end

    if !payload.success? && !payload.error.code.in?([404])
      return case payload.error.code
             when 401 then
               render json: {
                 error: 'access token expired'
               }, status: :unauthorized
             when 403 then
               render json: {
                 error: 'access denied'
               }, status: :forbidden
             when 500 then
               render json: {
                 error: 'internal server error'
               }, status: :internal_server_error
             else
               render json: {
                 error: 'unknown error'
               }, status: :bad_request
             end
    end

    # App

    app = App.find_or_create_by!(id: payload.app.id)
    app.update(name: payload.app.name)

    # User

    if payload.success?
      user = User.find_or_create_by!(id: payload.body.id)

      UserJob.perform_later(user.id, payload.body.to_json)
    end

    # App Token

    app_token = app.apps_tokens.create!(user: user)

    render json: {
      access_token: JsonWebToken.encode(app_token_id: app_token.id)
    }
  end
end
