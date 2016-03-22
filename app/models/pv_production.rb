class PvProduction < ApplicationRecord
  
  include Importable
  
  def fields_to_import
    ['pv_production_sum']
  end
  
end
