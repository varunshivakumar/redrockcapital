class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :num_shares
      t.integer :transaction_fee
      t.boolean :completed

      t.belongs_to :account, index: true
      t.belongs_to :employee, index: true
      t.belongs_to :stock, index: true

      # 0 - Market, 1 - Market on Close, 2 - Hidden Stop, 3 - Trailing Stop
      t.integer :order_type

      # Market Order / Market on Close Order
      t.string :buy_sell_type

      # Hidden Stop Order / Trailing Stop Order
      t.integer :price_per_share

      t.timestamps null: false
    end
  end
end
