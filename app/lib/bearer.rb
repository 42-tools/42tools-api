module Bearer
  module_function

  def decode(authorization)
    return if authorization.blank?

    type, credentials = authorization.split(' ')

    return if type != 'Bearer'

    JsonWebToken.decode(credentials)&.first
  end
end
