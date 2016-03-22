class FreeOnSelfConsumption < ApplicationRecord

  include Importable
  
  def fields_to_import
    ['up_10_kwp', 'payable_share_on_self_consumption']
  end
  
end
