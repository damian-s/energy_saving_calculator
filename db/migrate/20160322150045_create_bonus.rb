class CreateBonus < ActiveRecord::Migration[5.0]
  def change
    create_table :bonuses do |t|
      t.integer :bonus_range_id, null: false
      t.integer :month, null: false
      t.integer :year, null: false
      t.string :type, null: false
      t.decimal :bonus_value, scale: 4, precision: 18, null: false
      t.timestamps
    end
  end
end
