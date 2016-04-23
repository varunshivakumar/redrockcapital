class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.belongs_to :client_id, index: true
      t.belongs_to :employee_id, index: true

      t.timestamps null: false
    end
  end
end
