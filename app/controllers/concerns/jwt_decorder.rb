class JwtDecorder
  attr_reader :auth_errors

  def initialize(headers)
    @headers = headers
    @auth_errors = []
  end

  def token
    authorization_header = @headers['Authorization']
    if authorization_header.present?
      authorization_header.split(' ').last
    else
      @auth_errors.push('Token missing')
      nil
    end
  end

  def token_contents
    decoded = JwtAuthentication.decode(token)
    decoded || (@auth_errors.push('Token expired') && nil)
  end

  def current_user
    user = User.find_by(id: token_contents[:user_id])
    user || (@auth_errors.push('Invalid Token') && nil)
  end

  def authenticate_user
    current_user || (raise JWT::DecodeError && nil)
  end
end
