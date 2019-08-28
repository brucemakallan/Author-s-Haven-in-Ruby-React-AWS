module ErrorHandler
  def self.included(including_class)
    including_class.class_eval do
      rescue_from StandardError do |e|
        respond(e)
      end

      rescue_from ActiveRecord::RecordNotFound do |e|
        respond(e, 'Not Found', :not_found)
      end

      rescue_from ActionController::ParameterMissing do |e|
        respond(e, 'Invalid / Bad Request')
      end

      rescue_from ActiveRecord::NotNullViolation do |e|
        respond(e, 'Required field missing')
      end
    end
  end

  def respond(error, message = 'Error', error_code = :internal_server_error)
    render json: { error: message, details: error }, status: error_code
  end
end
