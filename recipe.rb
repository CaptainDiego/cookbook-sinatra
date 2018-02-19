
class Recipe
  attr_accessor :description, :name, :cooking_time, :difficulty, :done

  def initialize(name, description, cooking_time, difficulty, done)
    @name = name
    @description = description
    @cooking_time = cooking_time
    @difficulty = difficulty
    @done = done == "true"
  end
end
