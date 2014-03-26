class CreateBundles < ActiveRecord::Migration
  def change
    create_table :bundles do |t|
      t.column :cashier_id, :integer

      t.timestamps
    end
  end
end
