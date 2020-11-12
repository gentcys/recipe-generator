class UsersController < ApplicationController
  def search_histories
    user = User.find_by!(username: params[:username].downcase)
    @search_histories = user.search_histories
  end
end
