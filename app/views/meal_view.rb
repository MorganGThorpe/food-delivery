class MealView
  def display(meals)
    meals.each do |meal|
      puts "#{meal.id}. #{meal.name} (£#{meal.price})"
    end
  end

  def ask_for(stuff)
    puts "What's the #{stuff} of your meal?"
    gets.chomp
  end
end
