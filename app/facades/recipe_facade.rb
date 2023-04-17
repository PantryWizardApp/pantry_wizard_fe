class RecipeFacade
   def initialize(recipe)
    @recipe = recipe
   end
   
  def self.recipe(id)
    recipe = RecipeService.get_recipe(id)
    Recipe.new(recipe)
  end

  private

  # def self.service
  #   @_service ||= RecipeService.new
  # end
end