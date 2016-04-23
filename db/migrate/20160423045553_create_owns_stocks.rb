class CreateOwnsStocks < ActiveRecord::Migration
  def change
    create_table :owns_stocks do |t|
      t.integer :num_shares
      t.integer :bought_price

      t.timestamps null: false
    end
  end
end
