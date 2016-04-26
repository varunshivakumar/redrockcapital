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

      # Client Specific Information
      t.string :credit_card_no
      t.integer :rating

      # Employee Specific Information
      t.text :bio
      t.integer :hourly_rate

      t.timestamps
    end
  end
end
