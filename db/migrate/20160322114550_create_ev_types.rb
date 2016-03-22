class CreateEvTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :ev_types do |t|
      t.string :name, null: false
      t.timestamps
    end
  end
end
