require 'csv'
require_relative '../models/customer'

class CustomerRepository
  def initialize(csv_file)
    @csv_file = csv_file
    @customers = []
    @next_id = 1
    load_csv if File.exist?(@csv_file)
  end

  def load_csv
    CSV.foreach(@csv_file, headers: :first_row, header_converters: :symbol) do |row|
      row[:id] = row[:id].to_i
      @customers << Customer.new(row)
    end

    @next_id = @customers.empty? ? 1 : @customers.last.id + 1
  end

  def all
    @customers
  end

  def add(customer)
    customer.id = @next_id
    @customers << customer
    @next_id += 1
    save_csv
  end

  def save_csv
    CSV.open(@csv_file, 'wb') do |csv|
      csv << ['id', 'name', 'address']
      @customers.each do |customer|
        csv << [customer.id, customer.name, customer.address]
      end
    end
  end

  def find(id)
    @customers.find { |customer| customer.id == id }
  end

  def update(id, name, address)
    # finding the customer we want to update
    customer_to_update = find(id)
    # updating the name of the customer
    customer_to_update.name = name
    # update the address of the customer
    customer_to_update.address = address
    # # saving the new data to csv
    save_csv
  end

  def delete(id)
    # finding the customer to delete
    customer_to_delete = find(id)
    # removing the customer from the array of customers
    @customers.delete(customer_to_delete)
    # saving the new data to csv
    save_csv
  end
end
