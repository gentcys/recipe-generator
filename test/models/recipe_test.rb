require 'test_helper'

class RecipeTest < ActiveSupport::TestCase
  def setup
    @recipe = Recipe.new(name: "Nick", description: "An totally new recipe",
                         time: 666, difficulty: 3)
  end

  def test_with_all_valid_attributes
    assert @recipe.valid?
  end

  def test_without_name_attribute
    @recipe.name = nil
    assert_not @recipe.valid?
  end

  def test_with_too_long_name
    @recipe.name = "N" * 256
    assert_not @recipe.valid?
  end

  def test_without_description_attribute
    @recipe.description = nil
    assert_not @recipe.valid?
  end

  def test_with_too_long_description
    @recipe.description = "N" * 1001
    assert_not @recipe.valid?
  end

  def test_without_time_attribute
    @recipe.time = nil
    assert_not @recipe.valid?
  end

  def test_with_too_high_time
    @recipe.time = 7 * 24 * 60 + 1
    assert_not @recipe.valid?
  end

  def test_without_difficulty_attribute
    @recipe.difficulty = nil
    assert_not @recipe.valid?
  end

  def test_with_too_high_difficulty
    @recipe.difficulty = 6
    assert_not @recipe.valid?
  end
end
