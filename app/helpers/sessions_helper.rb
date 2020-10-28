module SessionsHelper
  # Signs in the given user.
  def sign_in(user)
    session[:user_id] = user.id
  end

  # Returns the current signed-in user (if any).
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  # Returns true if the user is signed in, false otherwise.
  def signed_in?
    !current_user.nil?
  end
end
