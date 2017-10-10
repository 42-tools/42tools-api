require 'jwt'

module JsonWebToken
  module_function

  def encode(payload = {})
    Base64.strict_encode64(JWT.encode(payload, Rails.application.secrets.secret_key_base, 'HS256'))
  end

  def decode(token)
    JWT.decode(Base64.strict_decode64(token), Rails.application.secrets.secret_key_base, true, { algorithm: 'HS256' })
  rescue
    nil
  end
end
