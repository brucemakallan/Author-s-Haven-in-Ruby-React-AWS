class JwtAuthentication
  EXPIRY = 24.hours.from_now.to_i

  def self.encode(user)
    payload = {
      user_id: user.id,
      first_name: user.first_name,
      last_name: user.last_name,
      email: user.email,
      exp: EXPIRY
    }
    JWT.encode(payload, Rails.application.secrets.secret_key_base.to_s, 'HS256')
  end

  def self.decode(token)
    body, _header = JWT.decode(
      token, Rails.application.secrets.secret_key_base.to_s, true, algorithm: 'HS256'
    )
    HashWithIndifferentAccess.new(body)
  rescue JWT::ExpiredSignature
    nil
  end
end
