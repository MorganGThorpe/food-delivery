class Customer
  attr_accessor :id, :name, :address # attr_accessor for :nam, and :address necessary to update the customer
  def initialize(attr = {})
    @id = attr[:id]
    @name = attr[:name]
    @address = attr[:address]
  end
end
