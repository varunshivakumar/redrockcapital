class CreateTrailingStopOrders < ActiveRecord::Migration
  def change
    create_table :trailing_stop_orders do |t|
      t.integer :price_per_share

      t.timestamps null: false
    end
  end
end
