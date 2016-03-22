class CreateFreeOnSelfConsumptions < ActiveRecord::Migration[5.0]
  def change
    create_table :free_on_self_consumptions do |t|
      t.integer :year, null: false
      t.decimal :up_10_kwp, scale: 4, precision: 18, null: false
      t.decimal :payable_share_on_self_consumption, scale: 4, precision: 18, null: false
      t.timestamps
    end
  end
end
