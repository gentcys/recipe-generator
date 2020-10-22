require 'test_helper'

class PageFlowTest < ActionDispatch::IntegrationTest
  test 'can see home page' do
    get root_path
    assert_template 'pages/home'
  end

  test 'can see nav bar of home page' do
    get root_path
    assert_template 'application/_header'
  end
end
