@SolarToVehicleForm = React.createClass

  propTypes:
    form_settings: React.PropTypes.object
    
  getInitialState: ()->
    @props.form_settings
    
  componentDidMount: ()->
    
  pv_system_settings: ()->
    @state.pv_system || {}
    
  electric_vehicle_settings: ()->
    @state.electric_vehicle || {}
    
  charging_behavior_settings: ()->
    @state.charging_behavior || {}
    
  electricity_consumption_settings: ()->
    @state.electricity_consumption || {}
    
  result_settings: ()->
    @state.result || {}
  
  render: ->
    `<div className="container">
      <br />
      <div className='row'>
        <SvHeader/>
      </div>
      <div className='row'>
        <PvSystem form_settings={ this.pv_system_settings() } />
      </div>
      <div className='row'>
        <ElectricVehicle form_settings={ this.electric_vehicle_settings() } />
      </div>
      <div className='row'>
        <ChargingBehavior form_settings={ this.charging_behavior_settings() }/>
      </div>
      <div className='row'>
        <ElectricityConsumption form_settings={ this.electricity_consumption_settings() }/>
      </div>
      <div className='row'>
        <Result form_settings={ this.result_settings() } />
      </div>
    </div>`
    
