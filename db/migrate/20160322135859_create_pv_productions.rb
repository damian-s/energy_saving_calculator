class CreatePvProductions < ActiveRecord::Migration[5.0]
  def change
    create_table :pv_productions do |t|
      t.string :zip_code_start, null: false
      t.string :zip_code_stop
      t.decimal :pv_production_sum, scale: 4, precision: 18, null: false
      t.timestamps
    end
  end
end
