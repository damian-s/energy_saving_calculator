class IndexController < ApplicationController
  
  def solar_to_vehicle_form
    @form_settings = {
      pv_system: { location: 'location1', power: '100', date: '2015-01-13' },
      electric_vehicle: {
        entry_type: 'from_list', 
        entry_type_values: ['', 'from_list', 'manual'],
        ev_list: {
          selected_ev: {name: 'audi', battery_capacity: '4', charging_power: '5', consumption: '6'},
          evs: [
            {name: 'bmw', battery_capacity: '1', charging_power: '2', consumption: '3'},
            {name: 'audi', battery_capacity: '4', charging_power: '5', consumption: '6'},
            {name: 'smart', battery_capacity: '7', charging_power: '8', consumption: '9'}
          ]
        },
        ev_params: {battery_capacity: '123', charging_power: '456', consumption: '2'}
      },
      charging_behavior: {
        average_capacity_at_start: '30',
        average_daily_driving_distance: '100',
        availabilities: { 
          types: ['weekday', 'weekend'],
          selected_type: 'weekday',
          timeslots: [
            { start: '18:00', stop: '20:00', type: 'weekday' },
            { start: '21:00', stop: '23:00', type: 'weekday' },
            { start: '10:00', stop: '15:00', type: 'weekend' },
            { start: '17:00', stop: '22:00', type: 'weekend' }
          ]
        },
      },
      electricity_consumption: {test: 'aaa4'},
      result: {test: 'aaa5'}
    }
  end
  
end
