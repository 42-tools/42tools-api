class Oauth::AuthorizeController < ApplicationController
  skip_before_action :authenticate_app!
  before_action :set_app, only: %i(show)

  def show
    redirect_uri = params.require(:redirect_uri)
    client_credentials = FortyTwo::Api.new(uid: @app.uid, secret: @app.secret)
    payload = client_credentials.authorize(code: params.require(:code), redirect_uri: redirect_uri)

    if payload.success?
      render json: payload.body
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
