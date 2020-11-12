require 'test_helper'

class RecipeFlowTest < ActionDispatch::IntegrationTest
  def setup
    @recipe_one = Recipe.new(name: 'Something', difficulty: 2,
                             time: 20, description: 'This is a game!')
    @recipe_one.save
    @user = users(:one)
    @user.save
  end

  test 'show a list of suggested recipes by keyword asynchronously in a dropdown' do
    get root_path
    assert_template 'pages/home'

    get recipes_suggest_path + '?name=Some'

    assert_template 'recipes/suggest'
    assert_template layout: false

    assert "a[href=#{recipe_path(@recipe_one)}]", @recipe_one.name
  end

  test 'show serach reault of recipes by keyword in a new page' do
    get root_path
    assert_template 'pages/home'

    get recipes_search_path + '?name=Some'

    assert_template 'recipes/search'
    assert "a[href=#{recipe_path(@recipe_one)}]", @recipe_one.name
  end

  test 'save user search history if one signed in' do
    get root_path
    sign_in_as(@user, { password: 'foobar' })

    keyword = 'Some'
    get recipes_search_path, params: { name: keyword }

    assert(@user.search_histories.any? { |search| search.keyword == keyword })
  end
end
