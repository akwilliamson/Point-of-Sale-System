class ChangeBackRegisterId < ActiveRecord::Migration
  def self.up
    rename_column :ringups, :register_id, :cashier_id
  end
end
