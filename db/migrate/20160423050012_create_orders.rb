class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :num_shares
      t.integer :transaction_fee
      t.boolean :completed

      t.belongs_to :account
      t.belongs_to :employee
      t.belongs_to :stock

      # Market Order / Market on Close Order
      t.string :buy_sell_type

      # Hidden Stop Order / Trailing Stop Order
      t.integer :price_per_share

      t.timestamps null: false
    end
  end
end
