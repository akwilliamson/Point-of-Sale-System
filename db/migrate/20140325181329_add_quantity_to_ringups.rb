class AddQuantityToRingups < ActiveRecord::Migration
  def change
    add_column :ringups, :quantity, :integer
  end
end
