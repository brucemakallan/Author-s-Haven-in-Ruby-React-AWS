module ErrorHandler
  def self.included(including_class)
    including_class.class_eval do
      rescue_from StandardError do |e|
        respond(e, :internal_server_error)
      end

      rescue_from ActiveRecord::RecordNotFound do |e|
        respond(e, :not_found, 'Not Found')
      end

      rescue_from ActionController::ParameterMissing do |e|
        respond(e, :not_found, 'Invalid / Bad Request')
      end
    end
  end

  def respond(error, error_code, message = 'Error')
    render json: { error: message, details: error }, status: error_code
  end
end
