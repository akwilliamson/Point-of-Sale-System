require 'active_record'
require 'rspec'
require 'shoulda-matchers'

require 'inventory'
require 'cashier'
require 'bundle'

database_configuration = YAML::load(File.open('./db/config.yml'))
test_configuration = database_configuration["test"]
ActiveRecord::Base.establish_connection(test_configuration)

RSpec.configure do |config|
  config.after(:each) do
    Cashier.all.each { |x| x.destroy }
    Inventory.all.each { |x| x.destroy }
  end
end
