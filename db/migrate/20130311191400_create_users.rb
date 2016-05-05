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

      t.boolean :is_employee, default: false
      # Client Specific Information
      t.string :credit_card_no
      t.integer :rating, default: 1

      # Employee Specific Information
      t.integer :hourly_rate, default: 0

      # Special
      t.decimal :investment, precision: 6, scale: 2, default: 0

      t.timestamps
    end
  end
end
