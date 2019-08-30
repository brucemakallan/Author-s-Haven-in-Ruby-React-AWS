class ApplicationController < ActionController::API
  include ErrorHandler

  INVALID_INPUT = 'Invalid Input'.freeze

  before_action :configure_permitted_parameters, if: :devise_controller?

  def render_resource(resource)
    if resource.errors.empty?
      render json: resource
    else
      render json: { error: INVALID_INPUT, details: resource.errors }, status: :bad_request
    end
  end

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :email, :password, :password_confirmation])
  end
end
