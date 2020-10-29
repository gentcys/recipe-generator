require 'test_helper'

class UserFlowTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:one)
  end

  test 'can see home page' do
    get root_path
    assert_template 'pages/home'
  end

  test 'can see nav bar of home page' do
    get root_path
    assert_template 'application/_header'
  end

  test 'sign in with invalid information' do
    post sessions_create_path, params: { session: { username: '', password: '' } }
    response_json = JSON.parse(@response.body)
    assert 'Failed to sign in! Username or password is incorrect.', response_json[1]
  end

  test 'redirect to user page while sign in successfully' do
    post sessions_create_path, params: { session: { username: 'MyString', password: 'foobar' } }
    response_json = JSON.parse(@response.body)
    assert @user.id, response_json[:id]
    assert @user.id, session[:user_id]
  end
end
