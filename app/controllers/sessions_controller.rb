class SessionsController < ApplicationController
  def create
    user = User.find_by(username: session_params[:username])
    if user&.authenticate(session_params[:password])
      # Sign user in and return user info.
      sign_in user
      remember user
      render json: user, status: :ok
    else
      flash.now[:error] = 'Failed to sign in! Username or password is incorrect.'
      render json: flash, status: :bad_request
    end
  end

  def destroy
  end

  private

  def session_params
    params.require(:session).permit(:username, :password)
  end
end
