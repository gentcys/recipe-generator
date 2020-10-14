require 'test_helper'

class RecipeFlowTest < ActionDispatch::IntegrationTest
  def setup
    @recipe_one = Recipe.new(name: 'Something', difficulty: 2,
                             time: 20, description: 'This is a game!')
    @recipe_one.save
  end

  test 'can redirect back to home page if no recipes found' do
    get recipes_generate_path, params: { recipe: { name: 'abcdef', difficulty: 3 } }
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_select 'h1', 'Recipe Generator'
  end

  test 'can show recipe when conditions matched' do
    get recipes_generate_path, params: { recipe: { name: 'Something', difficulty: 2 } }
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_select 'span', 'Something'
  end
end
