class RecipesController < ApplicationController
  def show
    @recipe = RecipeFacade.recipe(params[:id])
  end
end