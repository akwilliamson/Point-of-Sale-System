require 'active_record'
require './lib/inventory'
require './lib/cashier'
require './lib/bundle'
require './lib/ringup'

database_configuration = YAML::load(File.open('./db/config.yml'))
development_configuration = database_configuration["development"]
ActiveRecord::Base.establish_connection(development_configuration)

def start_menu
  puts "HI THERE!"
  puts "*****************************"
  puts "If you're a manager, type 'm'"
  puts "If you're a cashier, type 'c'"
  puts "*****************************"
  input = gets.chomp
  case input
  when 'm'
    pos_menu
  when 'c'
    log_in
  end
end

def pos_menu
  choice = nil
  until choice == 'x'
    puts "\nPress 'a' to add inventory"
    puts "Press 'l' to list current inventory"
    puts "Press 'n' to authorize a new cashier"
    puts "Press 's' to show all authorized cashiers"
    puts "Press 'x' to exit"
    choice = gets.chomp.downcase
    case choice
    when 'a'
      add_inventory
    when 'l'
      list_inventory
    when 's'
      show_cashiers
    when 'n'
      add_cashier
    when 'x'
      puts "Later!"
    else
      puts "invalid."
      pos_menu
    end
  end
end

def add_inventory
  puts "\nName the inventory you want to add"
  name = gets.chomp.capitalize
  puts "What is the price point of this product?"
  price = gets.chomp.to_i
  puts "How many units of this product are you adding?"
  units = gets.chomp.to_i
  inventory = Inventory.create(:name => name, :price => price, :total_quantity => units)
  puts "'#{inventory.name}' has been added to your stock. What it do."
end

def list_inventory
  Inventory.all.each do |item|
    puts "\n#{item.name}: #{item.total_quantity} units"
  end
end

def add_cashier
  puts "\nEnter name of new Cashier"
  name = gets.chomp
  cashier = Cashier.create(:name => name)
  puts "\n#{cashier.name} has been saved to the your Cashiers Table with id of #{cashier.id}"
end

def show_cashiers
  Cashier.all.each do|cashier|
    puts "#{cashier.id}. #{cashier.name}\n"
  end
end

def log_in
  puts "\nEnter your cashier id:"
  cashierId = gets.chomp.to_i
  cashier = Cashier.logging_in(cashierId)
  puts "\n *#{cashier.name}* is now logged in!"
  cashing
end

def cashing
  cashier = Cashier.logged_in
  do_new_ringup = 'Y'
  bundle = Bundle.create(:cashier_id => cashier.id, :transaction_total => 0)
  until do_new_ringup == 'N'
    puts "Enter product name being sold:"
    name = gets.chomp.capitalize
    puts "Enter quantity:"
    quantity = gets.chomp.to_i
    product = Inventory.where({:name => name}).first
    ringup = Ringup.create({:inventory_id => product.id, :bundle_id => bundle.id, :quantity => quantity})
    bundle.add_ringup(ringup.quantity, product.price)
    product.update_quantity(quantity)
    puts "Total: #{bundle.transaction_total}"
    puts "Another Item? 'Y' for Yes, 'N' for No."
    do_new_ringup = gets.chomp.upcase
  end
  puts "Transaction complete"
  products = []
  ringups = Ringup.where({:bundle_id => bundle.id})
  ringups.each do |ringup|
    products << Inventory.where({:id => ringup.inventory_id}).first
  end
  puts "WTF!"
  products.each_with_index do |product, index|
    puts "#{product.name} at #{product.price} x #{ringups[index].quantity}"
  end
  puts "Total transaction: #{bundle.transaction_total}"
  puts "Press 'n' for new transaction"
  puts "Press 'r' for view receipt"
  puts "Press 'o' to log out"
  input = gets.chomp.downcase
  case input
  when 'n'
    cashing
  when 'o'
    start_menu
  end
end

start_menu











