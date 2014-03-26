class Inventory < ActiveRecord::Base
  def update_quantity(quantity)
    if quantity <= self.total_quantity
      self.update(:total_quantity => self.total_quantity - quantity)
    end
  end
end
