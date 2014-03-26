class RenameProductsToInventory < ActiveRecord::Migration
  def self.up
    rename_table :products, :inventory
  end

  def self.down
    rename_table :inventory, :products
  end
end
