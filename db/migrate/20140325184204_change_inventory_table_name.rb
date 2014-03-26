class ChangeInventoryTableName < ActiveRecord::Migration
  def self.up
    rename_table :inventory, :inventories
  end
end
