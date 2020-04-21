class CustomerView
  def display(customers)
    customers.each do |customer|
      # displaying all the customers with their id. Could use the index
      # instead but I think the id is a better option for update and delete
      puts "#{customer.id}. #{customer.name.capitalize} - Lives in #{customer.address.capitalize}"
    end
  end

  def ask_for(stuff)
    # asking for the user input
    puts "Please enter the #{stuff} of the customer"
    gets.chomp
  end
end
