class Bonus < ApplicationRecord
  
  belongs_to :bonus_range
  
  self.table_name = 'bonuses'

end
