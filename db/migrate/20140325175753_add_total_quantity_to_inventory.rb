class AddTotalQuantityToInventory < ActiveRecord::Migration
  def change
    add_column :inventory, :total_quantity, :integer
  end
end
