class CreatePpsPoints < ActiveRecord::Migration
  def change
    create_table :pps_points do |t|
      t.belongs_to :stock
      t.decimal :price_per_share, precision: 6, scale: 2

      t.timestamps null: false
    end
  end
end
