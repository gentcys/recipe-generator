require 'test_helper'

class SessionFlowTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:one)
  end

  test 'sign in with invalid information' do
    get root_url
    assert_template 'pages/home'
    post sessions_create_path, params: { session: { username: '', password: '' } }
    assert_template layout: false
    assert_response :bad_request
    assert 'Failed to sign in! Username or password is incorrect.', response.parsed_body[1]
  end

  test 'sign in with valid infomation' do
    get root_url
    post sessions_create_path, params: { session: { username: @user.username, password: 'foobar' } }
    assert_template layout: false
    assert_response :success
    assert @user.id, session[:user_id]
  end

  test 'sign in successfully followed by sign out' do
    get root_url
    post sessions_create_path, params: { session: { username: @user.username, password: 'foobar' } }
    assert_template layout: false
    assert_response :success
    assert @user.id, session[:user_id]
    delete sessions_destroy_path
    assert_redirected_to root_path
    follow_redirect!
    assert_response :success
    assert_not session[:user_id]
  end
end
