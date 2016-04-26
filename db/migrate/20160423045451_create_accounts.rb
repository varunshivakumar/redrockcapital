class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.belongs_to :client, index: true
      t.belongs_to :employee, index: true

      t.timestamps null: false
    end
  end
end
