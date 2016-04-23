class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :num_shares
      t.integer :price_per_share
      t.integer :transaction_fee
      t.boolean :completed

      t.timestamps null: false
    end
  end
end
