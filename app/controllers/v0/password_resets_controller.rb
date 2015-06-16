module V0
  class PasswordResetsController < ApplicationController

    def create
      @user = User.find_by!(username: params.require(:username))
      authorize @user, :request_password_reset?
      @user.send_password_reset
      render json: {message: 'Password Reset Instructions Delivered'}, status: :ok
    end

    def show
      @user = User.find_by!(password_reset_token: params[:id])
      @current_user = @user
      authorize @user, :update_password?
      render 'users/show', status: :ok
    end

    def update
      @user = User.find_by!(password_reset_token: params[:id])
      @current_user = @user
      authorize @user, :update_password?
      if @user.update_attributes({ password: params.require(:password), password_reset_token: nil })
        render 'users/show', status: :ok
      else
        raise Smartcitizen::UnprocessableEntity.new @user.errors
      end
    end

  end
end
