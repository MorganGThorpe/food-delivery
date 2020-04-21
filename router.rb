class Router
  def initialize(meals_controller, customers_controller)
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @running = true
  end

  def run
    puts "Welcome to your food delivery app"
    while @running
      display_options_to_user
      action = ask_action
      perform_action(action)
    end
  end

  def display_options_to_user
    puts
    puts "========================"
    puts "1. Add a meal"
    puts "2. List all meals"
    puts "3. Update a meal"
    puts "4. Delete a meal"
    puts "5. Add a customer"
    puts "6. List all customers"
    puts "7. Update a customer"
    puts "8. Delete a customer"
    puts "9. exit"
    puts "========================"
    puts
  end

  def ask_action
    print "> What would you like to do next?\n> "
    gets.chomp.to_i
  end

  def perform_action(action)
    case action
    when 1 then @meals_controller.add
    when 2 then @meals_controller.list
    when 3 then @meals_controller.update
    when 4 then @meals_controller.delete
    when 5 then @customers_controller.add
    when 6 then @customers_controller.list
    when 7 then @customers_controller.update
    when 8 then @customers_controller.delete
    when 9 then @running = false
    end
  end
end
