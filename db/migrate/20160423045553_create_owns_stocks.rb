class CreateOwnsStocks < ActiveRecord::Migration
  def change
    create_table :owns_stocks do |t|
      t.integer :num_shares, default: 0
      t.decimal :price_per_share, scale: 2

      t.belongs_to :account, index: true
      t.belongs_to :stock, index: true
      t.belongs_to :order, index: true

      t.timestamps null: false
    end
  end
end
