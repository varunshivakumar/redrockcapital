class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :address
      t.string :zipcode
      t.string :city
      t.string :state

      t.belongs_to :user, index: true
      t.timestamps null: false
    end
  end
end
