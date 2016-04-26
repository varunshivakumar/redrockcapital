class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :credit_card_no
      t.integer :rating
      t.timestamps null: false
    end
  end
end
