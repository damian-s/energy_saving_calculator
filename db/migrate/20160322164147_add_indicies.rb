class AddIndicies < ActiveRecord::Migration[5.0]
  def up
    add_index :evs, :ev_type_id
    add_index :evs, :model
    add_index :bonus_ranges, :min_value
    add_index :bonus_ranges, :max_value
    add_index :free_on_self_consumptions, :year
    add_index :pv_productions, :zip_code_start 
    add_index :pv_productions, :zip_code_stop 
    add_index :bonuses, :bonus_range_id
  end
  
  def down
    remove_index :evs, :ev_type_id
    remove_index :evs, :model
    remove_index :bonus_ranges, :min_value
    remove_index :bonus_ranges, :max_value
    remove_index :free_on_self_consumptions, :year
    remove_index :pv_productions, :zip_code_start 
    remove_index :pv_productions, :zip_code_stop 
    remove_index :bonuses, :bonus_range_id
  end
end
