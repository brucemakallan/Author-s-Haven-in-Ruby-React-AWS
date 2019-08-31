class ApplicationController < ActionController::API
  include ActionController::MimeResponds
  include ErrorHandler

  respond_to :json

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
    devise_parameter_sanitizer.permit(
      :sign_up, keys: %i[first_name last_name email password password_confirmation]
    )
  end
end
