require_relative "../views/meal_view"
require_relative "../models/meal"

class MealsController
  def initialize(meal_repository)
    @meal_repository = meal_repository
    @meal_view = MealView.new
  end

  def list
    meals = @meal_repository.all
    @meal_view.display(meals)
  end

  def add
    # need to ask the user what's the name of the meal
    name = @meal_view.ask_for('name')
    # need to ask the user what's the price of the meal
    price = @meal_view.ask_for('price').to_i
    # create a meal instance
    new_meal = Meal.new(name: name, price: price)
    # call the add method on our meal repository
    @meal_repository.add(new_meal)
  end

  def update
    # displaying the meals to the user
    list
    # ask user to select meal they want to update
    id = @meal_view.ask_for('id').to_i
    # ask for the new name
    name = @meal_view.ask_for('name')
    # ask for the new price
    price = @meal_view.ask_for('price')
    # send the info to the repository to update the meal
    @meal_repository.update(id, name, price)
  end

  def delete
    # displaying the meals to the user
    list
    # asking the user for the meal id they want to delete
    id = @meal_view.ask_for('id').to_i
    # sending the id to the repository to delete the corresponding meal
    @meal_repository.delete(id)
  end
end
