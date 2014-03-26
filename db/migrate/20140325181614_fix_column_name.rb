class FixColumnName < ActiveRecord::Migration
  def self.up
    rename_column :ringups, :product_id, :inventory_id
  end
end
