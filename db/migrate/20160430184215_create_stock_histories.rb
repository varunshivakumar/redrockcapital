class CreateStockHistories < ActiveRecord::Migration
  def change
    create_table :stock_histories do |t|
      t.belongs_to :stock
      t.decimal :price_per_share
      t.timestamps null: false
    end
  end
end
