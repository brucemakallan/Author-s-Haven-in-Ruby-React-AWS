module Api
  module V1
    class UsersController < ApplicationController
      INVALID_INPUT = 'Invalid Input'.freeze

      # signup
      def create
        @user = User.new(user_params)
        if @user.valid?
          @user.save
          token = JwtAuthentication.encode(@user)
          render :create, locals: { token: token }, status: :created
        else
          render json: { error: INVALID_INPUT, details: @user.errors }, status: :bad_request
        end
      end

      def user_params
        params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
      end
    end
  end
end
