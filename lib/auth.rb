class Auth
  SECRET = Rails.application.secrets.jwt_secret
  def self.encode(payload)
    JWT.encode(payload, SECRET)
  end

  def self.decode(token)
    payload, _algo =  JWT.decode(token, SECRET)
    payload
  end
end
