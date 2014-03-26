require 'spec_helper'

describe Inventory do
  it 'should create inventory and update quantity' do
    product = Inventory.create({:name => 'Avacado', :price => 3.55, :total_quantity => 100})
    product.update_quantity(20)
    product.total_quantity.should eq 80
  end

  it 'keeps original quantity if a higher quantity is inputted' do
    product = Inventory.create({:name => 'Avacado', :price => 3.55, :total_quantity => 100})
    product.update_quantity(775)
    product.total_quantity.should eq 100
  end
end
