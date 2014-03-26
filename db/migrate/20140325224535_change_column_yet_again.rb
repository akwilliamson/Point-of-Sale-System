class ChangeColumnYetAgain < ActiveRecord::Migration
  def self.up
    rename_column :ringups, :cashier_id, :bundle_id
  end
end
