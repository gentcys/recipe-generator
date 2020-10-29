require 'test_helper'

class UserFlowTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:one)
  end

  test 'can see home page' do
    get root_path
    assert_template 'pages/home'
  end
end
