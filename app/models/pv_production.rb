class PvProduction < ApplicationRecord
  
  include Importable
  
  def fields_to_import
    ['pv_production_sum']
  end
  
  def self.zip_codes
    order(:zip_code_start).map do |pvp|
      "#{ pvp.zip_code_start } - #{pvp.zip_code_stop}"
    end
  end
  
end
