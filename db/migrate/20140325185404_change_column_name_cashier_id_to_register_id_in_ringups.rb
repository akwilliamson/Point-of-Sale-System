class ChangeColumnNameCashierIdToRegisterIdInRingups < ActiveRecord::Migration
  def self.up
    rename_column :ringups, :cashier_id, :register_id
  end
end
