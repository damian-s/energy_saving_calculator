class CreateBonusRanges < ActiveRecord::Migration[5.0]
  def change
    create_table :bonus_ranges do |t|
      t.decimal :min_value, scale: 4, precision: 18
      t.decimal :max_value, scale: 4, precision: 18
      t.timestamps
    end
  end
end
