class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.integer :rating
      t.integer :credit_card_no

      t.timestamps null: false
    end
  end
end
