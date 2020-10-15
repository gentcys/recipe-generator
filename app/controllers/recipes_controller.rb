class RecipesController < ApplicationController
  def generate
    id = Recipe.select(:id).find_by(generate_params)
    if id.nil?
      redirect_back(fallback_location: root_path)
    else
      redirect_to recipe_path(id: id)
    end
  end

  def suggest
    recipes = Recipe.select(:id, :name).where('name LIKE ?', "%#{params[:name]}%")

    render json: recipes, status: :ok
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  private

  def generate_params
    params.require(:recipe).permit(:name)
  end

  def suggest_params
    params.permit(:name)
  end
end
