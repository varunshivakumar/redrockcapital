class CreateHiddenStopOrders < ActiveRecord::Migration
  def change
    create_table :hidden_stop_orders do |t|
      t.integer :price_per_share

      t.timestamps null: false
    end
  end
end
