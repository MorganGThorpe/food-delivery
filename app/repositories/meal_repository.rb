require 'csv'
require_relative "../models/meal"

class MealRepository
  def initialize(csv_file)
    @csv_file = csv_file
    @meals = []
    @next_id = 1
    puts @csv_file
    puts File.exist?(@csv_file)
    load_csv if File.exist?(@csv_file)
  end

  def all
    @meals
  end

  def load_csv
    CSV.foreach(@csv_file, headers: :first_row, header_converters: :symbol) do |row|
      row[:id] = row[:id].to_i
      row[:price] = row[:price].to_i
      @meals << Meal.new(row)
    end
    @next_id = @meals.empty? ? 1 : @meals.last.id + 1
  end

  def add(meal)
    meal.id = @next_id
    @meals << meal
    @next_id += 1
    save_csv
  end

  def update(id, name, price)
    # finding the meal to update
    meal_to_update = find(id)
    # updating the name of the meal
    meal_to_update.name = name
    # updating the price of the meal
    meal_to_update.price = price
    # saving the new data to csv
    save_csv
  end

  def save_csv
    CSV.open(@csv_file, 'wb') do |csv|
      csv << ['id', 'name', 'price']
      @meals.each do |meal|
        csv << [meal.id, meal.name, meal.price]
      end
    end
  end

  def find(id)
    @meals.find { |meal| meal.id == id }
  end

  def delete(id)
    # finding the meal to delete
    meal_to_delete = find(id)
    # deleting the meal from the array of meals
    @meals.delete(meal_to_delete)
    # saving the data to csv
    save_csv
  end
end
