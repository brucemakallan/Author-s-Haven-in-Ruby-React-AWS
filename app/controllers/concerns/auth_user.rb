class AuthUser
  attr_reader :email, :password, :result, :auth_errors

  INVALID_CREDENTIALS = 'Invalid Credentials'.freeze

  def initialize(params)
    @email = params[:email]
    @password = params[:password]
    @auth_errors = ''
  end

  def auth_user
    User.find_by(email: email)
  end

  def password_valid?
    auth_user&.authenticate(password) # using bcrypt
  end

  def authenticate_user
    if password_valid?
      @result = JwtAuthentication.encode(auth_user)
    else
      @auth_errors = INVALID_CREDENTIALS
    end
  end
end
