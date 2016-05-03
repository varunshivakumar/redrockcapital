class CreateStocks < ActiveRecord::Migration
  def change
    create_table :stocks do |t|
      t.string :company_name
      t.string :stock_symbol
      t.string :stock_type
      t.decimal :price_per_share#, :precision => 2
      t.integer :total_num_shares

      t.timestamps null: false
    end
  end
end
