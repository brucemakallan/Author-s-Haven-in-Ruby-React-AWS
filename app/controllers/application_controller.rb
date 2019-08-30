class ApplicationController < ActionController::API
  include ErrorHandler

  def render_resource(resource)
    if resource.errors.empty?
      render json: resource
    else
      validation_error(resource)
    end
  end

  def validation_error(resource)
    render json: {
      error: 'Bad Request',
      detail: resource.errors
    }, status: :bad_request
  end
end
