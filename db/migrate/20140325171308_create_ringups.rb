class CreateRingups < ActiveRecord::Migration
  def change
    create_table :ringups do |t|
      t.column :product_id, :integer
      t.column :cashier_id, :integer

      t.timestamps
    end
  end
end
