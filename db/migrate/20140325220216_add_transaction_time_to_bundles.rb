class AddTransactionTimeToBundles < ActiveRecord::Migration
  def change
    add_column :bundles, :transaction_total, :float
  end
end
