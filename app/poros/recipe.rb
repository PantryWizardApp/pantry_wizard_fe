class Recipe
  attr_reader :id, 
              :name,
              :summary, 
              :ingredients,
              :instructions,
              :image,
              :source_url

  def initialize(recipe_data)
    @id = recipe_data[:id]
    @name = recipe_data[:title]
    @summary = recipe_data[:summary]
    @ingredients = ingredient_info(recipe_data[:extendedIngredients])
    @instructions = instruction_info(recipe_data[:analyzedInstructions])
    @image = recipe_data[:image]
    @source_url = recipe_data[:sourceUrl]
  end

  def ingredient_info(ingredient_array)
    x = ingredient_array.map do |ingredient|
      { name: ingredient[:name], amount: ingredient[:measures][:us][:amount], unit: ingredient[:measures][:us][:unitShort] }
    end
  end

  def instruction_info(instruction_array)
    x = instruction_array.map do |instruction|
          instruction[:steps].each do |step|
            { step: step[:number], instruction: step[:step] }
      end
    end
  end
end