class CreateOwnsStocks < ActiveRecord::Migration
  def change
    create_table :owns_stocks do |t|
      t.integer :num_shares
      t.integer :bought_price

      t.belongs_to :account_id
      t.belongs_to :stock_id

      t.timestamps null: false
    end
  end
end
