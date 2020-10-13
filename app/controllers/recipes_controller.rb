class RecipesController < ApplicationController
  def generate
    id = Recipe.select(:id).find_by(generate_params)
    if id.nil?
      redirect_back(fallback_location: root_path)
    else
      redirect_to recipe_path(id: id)
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  private
  def generate_params
    params.require(:recipe).permit(:id, :name, :difficulty)
  end
end
