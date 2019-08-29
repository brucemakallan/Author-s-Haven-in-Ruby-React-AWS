module Api
  module V1
    class UsersController < ApplicationController
      INVALID_INPUT = 'Invalid Input'.freeze

      def create
        @user = User.new(user_params)
        if @user.valid?
          @user.save
          render :create, status: :created
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
