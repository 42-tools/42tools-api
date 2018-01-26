class V1::TokensController < ApplicationController
  before_action :set_token, only: %i(show)

  # GET /tokens
  def index
    @tokens = paginate(tokens)
  end

  # GET /tokens/1
  def show
  end

private

  # Use callbacks to share common setup or constraints between actions.
  def set_token
    @token = tokens.find(params[:id])
  end

  def tokens
    (current_user || current_app).tokens
  end
end
