class IndexController < ApplicationController
  
  def solar_to_vehicle_form
    @form_settings = SolarToVehicleConfig.new.initial
  end
  
end
