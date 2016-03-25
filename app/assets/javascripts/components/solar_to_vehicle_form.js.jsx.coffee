@SolarToVehicleForm = React.createClass

  mixins: [ FormStatusHelpers ]

  propTypes:
    form_settings: React.PropTypes.object
    
  componentDidMount: ()->
    
    $('#stv_main_form').on 'change_acceptance', (event, form_name)=>
      #console.log @state
      @setState( new FormSwitcher(@state, form_name).toggle_acceptance().get_new_state() )
#      @change_acceptance(form_name)
      
    $('#stv_main_form').on 'submit_form', (event, form_name, new_form_data)=>
#      console.log @state
#      console.log new_form_data
      console.log(new FormSwitcher(@state, form_name).accept().show_next().get_new_state())
      @setState( new FormSwitcher(@state, form_name).accept().show_next().get_new_state() )
      @forceUpdate()
      
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
    `<div id='stv_main_form' className="container">
      <br />
      <div className='row'>
        <SvHeader/>
      </div>
      <div className='row'>
        { !this.is_form_hidden('pv_system') ? <PvSystem form_settings={ this.pv_system_settings() } /> : false }
      </div>
      <div className='row'>
        { !this.is_form_hidden('electric_vehicle') ? <ElectricVehicle form_settings={ this.electric_vehicle_settings() } /> : false }
      </div>
      <div className='row'>
        { !this.is_form_hidden('charging_behavior') ? <ChargingBehavior form_settings={ this.charging_behavior_settings() }/> : false }
      </div>
      <div className='row'>
        { !this.is_form_hidden('electricity_consumption') ? <ElectricityConsumption form_settings={ this.electricity_consumption_settings() }/> : false }
      </div>
      <div className='row'>
        { !this.is_form_hidden('result') ? <Result form_settings={ this.result_settings() } /> : false }
      </div>
    </div>`
    
