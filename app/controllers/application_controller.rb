class ApplicationController < ActionController::API
  include ErrorHandler

  def hello
    render json: { message: 'Welcome' }, status: :ok
  end
end
