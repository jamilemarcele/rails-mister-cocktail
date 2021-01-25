class RecipesController < ApplicationController
  before_action :set_cocktail, only: [:create]

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.cocktail = @cocktail
    @dose = Dose.new
    @review = Review.new

    if @recipe.save
      redirect_to cocktail_path(@cocktail)
    else
      render 'cocktails/show'
    end
  end


  private

  def set_cocktail
    # we need `cocktail_id` to associate dose with corresponding cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def recipe_params
    params.require(:recipe).permit(:instruction, :cocktail_id)
  end
end
