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
      ev: '',
      ev_list: cars,
      battery_capacity: '', 
      charging_power: '', 
      consumption: ''
    }   
  end
  
  def charging_behavior_initial_config
    {
      status: 'hidden',
      average_capacity_at_start: '35',
      average_daily_driving_distance: '50',
      availabilities: { 
        types: AVAILABILITES_TYPES,
        selected_type: AVAILABILITES_TYPES.first,
        timeslots: [],
        hour_start: '08:00',
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
      status: 'hidden',
      summary: {
        electricity_production_pv: '10',
        electricity_consumption_household: '20',
        electricity_consumption_ev: '30'
      },
      load_distribution: {
        self_consumption_household: { style: 'normal', data: [1,2,3] },
        self_consumption_pv: { style: 'normal', data: [4,5,6] },
        necessary_electricity_ev: {style: 'light', data: [7,8,9] },
        necessary_electricity_household: { style: 'light', data: [10,11,12] },
        grid_feed: { style: 'normal', data: [11, 22, 33] }
      },
      self_consumption: {
        relation: { style: 'bold', data: [30.0, 40.0, 50.0] }
      },
      savings: {
        self_consumption_savings: { style: 'normal', data: [11,22,33] },
        loss_of_bonus: { style: 'normal', data: [44, 55, 66] },
        self_consumption_fee: { style: 'normal', data: [77, 88, 99] },
        total: { style: 'summary', data: [111, 222, 333] }
      },
      cost_per_100: [
        [ I18n.t('result.description.focus_on_time_title'), 4], 
        [ I18n.t('result.description.focus_on_ev_title'), 40], 
        [ I18n.t('result.description.optimal_title'), 100]
      ]
    }
  end
  
  def cars
    @cars ||= Ev.all_to_hash
  end
  
  def zip_codes
    @zip_codes ||= PvProduction.zip_codes
  end
  
end