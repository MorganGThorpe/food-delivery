require_relative "../views/customer_view"
require_relative "../models/customer"
class CustomersController
  def initialize(customer_repository)
    @customer_repository = customer_repository
    @customer_view = CustomerView.new
  end

  def list
    # retrieve all the customers from our csv file
    customers = @customer_repository.all
    # call the view to display all the customers
    @customer_view.display(customers)
  end

  def add
    # ask user for customer name
    name = @customer_view.ask_for('name')
    # ask user for customer address
    address = @customer_view.ask_for('address')
    # create a new instance of customer
    customer = Customer.new(name: name, address: address)
    # add the new customer to the DB
    @customer_repository.add(customer)
  end

  def update
    # displaying the customer to the user
    list
    # asking the user for the id of the customer they want to update
    id = @customer_view.ask_for('id').to_i
    # asking the user for the new name
    name = @customer_view.ask_for('name')
    # asking for the new address
    address = @customer_view.ask_for('address')
    # send the new info to the repository to update the DB
    @customer_repository.update(id, name, address)
  end

  def delete
    # listing all customers
    list
    # asking the user for the id of the customer they want to delete
    id = @customer_view.ask_for('id').to_i
    # sending the id to the repository to delete the corresponding customer
    @customer_repository.delete(id)
  end
end
