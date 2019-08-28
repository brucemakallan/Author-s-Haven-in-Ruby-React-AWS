module Api
  module V1
    class SessionsController < ApplicationController
      INVALID_CREDENTIALS = 'Invalid credentials'.freeze

      def create
        user = User.where(email: params[:email]).first
        if user&.valid_password?(params[:password])
          render json: user.as_json(only: %i[id email authentication_token]), status: :created
        else
          render json: { error: INVALID_CREDENTIALS }, status: :unauthorized
        end
      end

      def destroy; end
    end
  end
end
