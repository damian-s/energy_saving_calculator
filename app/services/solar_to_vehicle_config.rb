class SolarToVehicleConfig
  
  ENTRY_TYPE_VALUES = ['', 'from_list', 'manual']
  AT_HOME_ON_WEEKDAYS_VALUES = ['false', 'true']
  YEARLY_CONSUMPTION_VALUES = ['enter_value', 'enter_people_no']
  AVAILABILITES_TYPES = ['weekday', 'weekend']
  
  def initial
    {
      pv_system: pv_system_initial_config,
      electric_vehicle: electric_vehicle_initial_config,
      charging_behavior: charging_behavior_initial_config,
      electricity_consumption: electricity_consumption_initial_config,
      result: result_initial_config
    }
  end
  
  private
  
  def pv_system_initial_config
    { 
      status: 'edit', 
      location: '',
      location_values: zip_codes,
      power: '', 
      date: ''
    }
  end
  
  def electric_vehicle_initial_config
    {
      status: 'hidden',
      entry_type: ENTRY_TYPE_VALUES.first, 
      entry_type_values: ENTRY_TYPE_VALUES,
      ev: cars.first[:name],
      ev_data: cars.first,
      ev_list: cars,
      battery_capacity: '', 
      charging_power: '', 
      consumption: ''
    }    
  end
  
  def charging_behavior_initial_config
    {
      status: 'hidden',
      average_capacity_at_start: '',
      average_daily_driving_distance: '',
      availabilities: { 
        types: AVAILABILITES_TYPES,
        selected_type: AVAILABILITES_TYPES.first,
        timeslots: [],
        hour_start: '8:00',
        hour_stop: '16:00'
      }
    }    
  end
  
  def electricity_consumption_initial_config
    {
      status: 'hidden',
      at_home_on_weekdays: '',
      at_home_on_weekdays_values: AT_HOME_ON_WEEKDAYS_VALUES,
      electricity_price: '',
      yearly_consumption: '',
      yearly_consumption_values: YEARLY_CONSUMPTION_VALUES,
      people_no: '',
      yearly_consumption_kwh: ''    
    }
  end
  
  def result_initial_config
    {
      status: 'edit',
      summary: {
        electricity_production_pv: '10',
        electricity_consumption_household: '20',
        electricity_consumption_ev: '30'
      }
    }
  end
  
  def cars
    @cars ||= Ev.all_to_hash
  end
  
  def zip_codes
    @zip_codes ||= PvProduction.zip_codes
  end
  
end