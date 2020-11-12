class SessionsController < ApplicationController
  def create
    user = User.find_by(username: session_params[:username].downcase)
    if user&.authenticate(session_params[:password])
      sign_in user
      session_params[:remember_me] == '1' ? remember(user) : forget(user)
      render layout: false
    else
      flash.now[:error] = 'Failed to sign in! Username or password is incorrect.'
      render json: flash, status: :bad_request
    end
  end

  def destroy
    sign_out if signed_in?
    redirect_to root_url
  end

  private

  def session_params
    params.require(:session).permit(:username, :password, :remember_me)
  end
end
