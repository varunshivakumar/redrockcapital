class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.text :bio
      t.integer :hourly_rate
      t.timestamps null: false
    end
  end
end
