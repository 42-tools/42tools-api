class Oauth::CallbackController < ApplicationController
  skip_before_action :authenticate_app!
  before_action :set_app, only: %i(show)

  delegate :url_helpers, to: 'Rails.application.routes'

  def show
    redirect_uri = params.require(:redirect_uri)
    client_credentials = FortyTwo::Api.new(uid: @app.uid, secret: @app.secret)
    payload = client_credentials.authorize(code: params.require(:code), redirect_uri: url_helpers.oauth_callback_url(@app.uid, redirect_uri: redirect_uri, host: request.base_url))

    if payload.success?
      uri = URI(redirect_uri)
      uri.query = URI.encode_www_form(payload.body.as_json)

      redirect_to uri.to_s
    else
      render json: {
        error: 'invalid grant'
      }, status: :unauthorized
    end
  end

private

  def set_app
    @app = FortyTwo::App.find_by!(uid: params[:id])
  end
end
