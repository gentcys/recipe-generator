require  'test_helper'

class SessionsHelperTest < ActionView::TestCase
  def setup
    @user = users(:one)
  end

  test 'session keeps id of user signed in' do
    sign_in(@user)
    assert_equal @user.id, session[:user_id]
  end

  test 'cookies keep is of user remembered' do
    remember(@user)
    assert_equal @user.id, cookies.signed[:user_id]
    assert_equal @user.remember_token, cookies[:remember_token]
  end

  test 'current_user returns right user when session is dropped' do
    remember(@user)
    assert_equal @user, current_user
    assert signed_in?
  end

  test 'current_user returns nil when remember digest changed' do
    remember(@user)
    @user.update_attribute(:remember_digest, User.digest(User.new_token))
    assert_nil current_user
  end

  test 'signed_in? returns true when user signs in' do
    sign_in(@user)
    assert signed_in?
  end

  test 'cookies does not keep id of user forgetted' do
    remember(@user)
    assert_equal @user.id, cookies.signed[:user_id]
    assert_equal @user.remember_token, cookies[:remember_token]
    forget(@user)
    assert_nil cookies.signed[:user_id]
    assert_nil cookies[:remember_token]
  end

  test 'session and cookies are cleaned when user signs out' do
    sign_in(@user)
    sign_out
    assert_not signed_in?
    assert_nil session[:user_id]
    assert_nil cookies.signed[:user_id]
    assert_nil cookies[:remember_token]
    assert_nil current_user
  end
end
