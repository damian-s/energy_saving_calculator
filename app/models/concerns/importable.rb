module Importable
  
  extend ActiveSupport::Concern
  
  def fields_to_import
    []
  end
  
  def assign_import_data(import_data)
    fields_to_import.each do |field|
      send("#{field}=", import_data[field])
    end
  end
  
end