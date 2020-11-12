require 'test_helper'

class UserFlowTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:one)
  end

  test 'can see home page' do
    get root_path
    assert_template 'pages/home'
  end

  test 'show search histories of current user' do
    get root_path
    sign_in_as(@user, { password: 'foobar' })

    keyword = 'Some'
    get recipes_search_path, params: { name: keyword }

    get user_search_histories_path(@user.username)
    assert_template 'users/search_histories'
  end
end
