class UsersController < ApplicationController
  def new
    render layout: false
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in(@user)
      render template: 'sessions/create', layout: false
    else
      render template: 'shared/_error_messages', layout: false
    end
  end

  def search_histories
    user = User.find_by!(username: params[:username].downcase)
    @search_histories = user.search_histories
  end

  private

  def user_params
    params.require(:user).permit(:name, :username, :email, :password, :password_confirmation)
  end
end
