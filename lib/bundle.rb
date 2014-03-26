class Bundle < ActiveRecord::Base

  def add_ringup(quantity, price)
    Bundle.update(self.id, :transaction_total => self.transaction_total += price * quantity)
  end
end
