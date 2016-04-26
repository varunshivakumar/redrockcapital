class CreateMarketOrders < ActiveRecord::Migration
  def change
    create_table :market_orders do |t|
      t.string :buy_sell_type
      t.timestamps null: false
    end
  end
end
