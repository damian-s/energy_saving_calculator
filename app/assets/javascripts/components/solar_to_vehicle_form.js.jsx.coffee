@SolarToVehicleForm = React.createClass

  mixins: [ FormStatusHelpers ]
  
  propTypes:
    form_settings: React.PropTypes.object
    locale: React.PropTypes.string
    
  componentWillMount: ()->
    @set_locale(@props.locale)
    
  componentDidMount: ()->
    $(@form_element_id()).on 'edit_form', (event, form_name)=>
      new_state = new FormSwitcher(@state, form_name).edit_form().get_new_state()
      @setState new_state
    $(@form_element_id()).on 'submit_form', (event, form_name, form_data)=>
      new_state = new FormSwitcher(@state, form_name).submit_form(form_data).get_new_state()
      @setState new_state
      
  form_name: 'stv_main'
  
  set_locale: (new_locale)->
    I18n.locale = new_locale
    I18n.defaultLocale = new_locale   
      
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
    `<div id={ this.form_element_name() } className="container">
      <br />
      <div className='row'>
        <SvHeader/>
      </div>
      <div className='row'>
        { !this.is_child_form_hidden('pv_system') ? <PvSystem form_settings={ this.pv_system_settings() } /> : false }
      </div>
      <div className='row'>
        { !this.is_child_form_hidden('electric_vehicle') ? <ElectricVehicle form_settings={ this.electric_vehicle_settings() } /> : false }
      </div>
      <div className='row'>
        { !this.is_child_form_hidden('charging_behavior') ? <ChargingBehavior form_settings={ this.charging_behavior_settings() }/> : false }
      </div>
      <div className='row'>
        { !this.is_child_form_hidden('electricity_consumption') ? <ElectricityConsumption form_settings={ this.electricity_consumption_settings() }/> : false }
      </div>
      <div className='row'>
        { !this.is_child_form_hidden('result') ? <Result form_settings={ this.result_settings() } /> : false }
      </div>
    </div>`
    
