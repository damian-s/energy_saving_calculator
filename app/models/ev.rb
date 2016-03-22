class Ev < ApplicationRecord
  belongs_to :ev_type
  
  include Importable
  
  def fields_to_import
    ['battery_capacity', 'charging_power', 'consumption', 'ev_type_id']
  end
  
#  FIELDS_TO_IMPORT = ['battery_capacity', 'charging_power', 'consumption']
#  
#  def assign_import_data(ev_type, ev_data)
#    self.ev_type_id = ev_type.id
#    FIELDS_TO_IMPORT.each do |field|
#      send("#{field}=", ev_data[field])
#    end
#  end
end
