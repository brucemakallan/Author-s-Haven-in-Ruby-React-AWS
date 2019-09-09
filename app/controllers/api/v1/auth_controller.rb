module Api
  module V1
    class AuthController < ApplicationController
      # login
      def create
        auth_user = AuthUser.new(login_params)
        auth_user.authenticate_user
        if auth_user.auth_errors.empty?
          render json: { token: auth_user.result }
        else
          render json: { error: auth_user.auth_errors }, status: :unauthorized
        end
      end

      private

      def login_params
        params.require(:user).permit(:email, :password)
      end
    end
  end
end
