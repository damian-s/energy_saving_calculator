class Ev < ApplicationRecord
  belongs_to :ev_type
  
  include Importable
  
  def fields_to_import
    ['battery_capacity', 'charging_power', 'consumption', 'ev_type_id']
  end
  
  def self.all_to_hash
    order(:model).all.map do |ev|
      { 
        name: ev.model, 
        battery_capacity: ev.battery_capacity.to_s, 
        charging_power: ev.charging_power.to_s, 
        consumption: ev.consumption.to_s
      }
    end
  end
  
end
