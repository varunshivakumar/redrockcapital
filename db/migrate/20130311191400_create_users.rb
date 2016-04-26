class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|

      t.string :ssn
      t.string :last_name
      t.string :first_name
      t.string :address
      t.string :zipcode
      t.string :city
      t.string :state
      t.string :telephone
      t.string :email

      t.timestamps
    end
  end
end
