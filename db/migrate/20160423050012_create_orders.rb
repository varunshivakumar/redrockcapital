class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :num_shares
      t.decimal :price_per_share
      t.string :buy_sell_type
      t.decimal :transaction_fee
      t.boolean :completed, default: false

      t.belongs_to :account, index: true
      t.belongs_to :employee, index: true
      t.belongs_to :stock, index: true

      # 0 - Market, 1 - Market on Close, 2 - Hidden Stop, 3 - Trailing Stop
      t.integer :order_type

      t.timestamps null: false
    end
  end
end
