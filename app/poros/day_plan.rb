class DayPlan
  attr_reader :recipes,
              :id,
              :user_id,
              :date

  def initialize(data)
    @recipes = recipe_info(data[:attributes][:recipes])
    @id = data[:id]
    @user_id = data[:attributes][:user_id]
    @date = data[:attributes][:date]
  end

  def recipe_info(recipe_array)
    x = recipe_array.map do |recipe|
      { local_id: recipe[:id], spoonacular_id: recipe[:spoonacular_id], name: recipe[:name], image: recipe[:image] }
    end
  end
end