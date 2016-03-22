class CreateEvs < ActiveRecord::Migration[5.0]
  def change
    create_table :evs do |t|
      t.integer :ev_type_id, null: false
      t.string :model, null: false
      t.decimal :battery_capacity, precision: 18, scale: 4, null: false
      t.decimal :charging_power,  precision: 18, scale: 4, null: false
      t.decimal :consumption,  precision: 18, scale: 4, null: false
      t.timestamps
    end
  end
end
