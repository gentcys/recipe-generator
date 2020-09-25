require 'test_helper'

class PageFlowTest < ActionDispatch::IntegrationTest
  test "can see home page" do
    get root_path
    assert_select "h1", "Recipe Generator"
  end
end
