class RecipeFacade 
  def self.recipe(id)
    RecipeService.get_recipe(id)
  end

  private

  # def self.service
  #   @_service ||= RecipeService.new
  # end
end