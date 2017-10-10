module Secrets
  module_function

  def get(*params)
    return Rails.application.secrets if params.size == 0

    secret_name = params.join('.')
    secret = Rails.application.secrets.dig(*params)

    raise ArgumentError, "missing `#{secret_name}` for #{Rails.env} environment must be a type of String, change this value in `config/secrets.yml`" if secret.nil?

    secret
  end
end
