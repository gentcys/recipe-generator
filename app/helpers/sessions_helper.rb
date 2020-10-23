module SessionsHelper
  # Signs in the given user.
  def sign_in(user)
    session[:user_id] = user.id
  end
end
