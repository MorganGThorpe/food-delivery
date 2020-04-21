class Meal
  attr_accessor :id, :name, :price # attr_accessor for :name and :price necessary for the update method
  def initialize(attr = {})
    @id = attr[:id]
    @name = attr[:name]
    @price = attr[:price]
  end
end
