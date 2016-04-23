class CreateStocks < ActiveRecord::Migration
  def change
    create_table :stocks do |t|
      t.string :company_name
      t.string :stock_symbol
      t.string :stock_type
      t.integer :price_per_share

      t.timestamps null: false
    end
  end
end
