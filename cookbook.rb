require_relative 'recipe'
require 'csv'

class Cookbook
  def initialize(csv_file_path)
    @csv_file_path = csv_file_path
    @recipes = []
    load_csv
  end

  def all
    @recipes
  end

  def add_recipe(recipe)
    @recipes << recipe
    save_to_csv
  end

  def remove_recipe(recipe_index)
    @recipes.delete_at(recipe_index)
    save_to_csv
  end

  def mark_as_done(recipe_index)
    @recipes[recipe_index].done = true
    save_to_csv
  end


  private

  def load_csv
    CSV.foreach(@csv_file_path) do |row|
      @recipes << Recipe.new(row[0], row[1], row[2], row[3], row[4])
    end
  end

  def save_to_csv
    CSV.open(@csv_file_path, "w") do |row|
      @recipes.each do |recipe|
        row << [recipe.name, recipe.description, recipe.cooking_time, recipe.difficulty, recipe.done ]
      end
    end
  end
end
