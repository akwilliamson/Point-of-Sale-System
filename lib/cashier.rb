class Cashier < ActiveRecord::Base
  @@logged_in = nil

  def self.logging_in(id)
    cashier = Cashier.where({:id => id}).first
    @@logged_in = cashier
    self.logged_in
  end

  def self.logged_in
    @@logged_in
  end
end
