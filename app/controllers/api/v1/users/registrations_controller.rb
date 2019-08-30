module Api
  module V1
    module Users
      class RegistrationsController < Devise::RegistrationsController
        respond_to :json

        def create
          build_resource(sign_up_params)
          resource.save
          render_resource(resource)
        end

        private

        def sign_up_params
          params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
        end
      end
    end
  end
end
