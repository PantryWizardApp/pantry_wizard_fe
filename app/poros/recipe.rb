class Recipe
  attr_reader :spoonacular_id, 
              :name,
              :summary, 
              :ingredients,
              :instructions,
              :image,
              :source_url,
              :cook_time

  def initialize(recipe_data)
    @spoonacular_id = recipe_data[:id]
    @name = recipe_data[:title]
    @summary = recipe_data[:summary]
    @ingredients = ingredient_info(recipe_data[:extendedIngredients])
    @instructions = instruction_info(recipe_data[:analyzedInstructions])
    @image = recipe_data[:image]
    @source_url = recipe_data[:sourceUrl]
    @cook_time = recipe_data[:readyInMinutes]
  end

  def ingredient_info(ingredient_array)
    ingredient_array.map do |ingredient|
      { name: ingredient[:name], amount: ingredient[:measures][:us][:amount], unit: ingredient[:measures][:us][:unitShort] }
    end
  end

  def instruction_info(instruction_array)
    instruction_array.map do |instruction|
      instruction[:steps].each do |step|
        { step: step[:number], instruction: step[:step] }
      end
    end
  end

  def recipe_poro_to_json
    {
      name: self.name,
      image: self.image,
      spoonacular_id: self.spoonacular_id
    }
  end
end