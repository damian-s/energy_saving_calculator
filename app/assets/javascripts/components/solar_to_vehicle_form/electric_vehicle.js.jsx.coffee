@ElectricVehicle = React.createClass
  
  mixins: [ FormStatusHelpers, SubmitScrollAnimate ]
  
  propTypes:
    form_settings: React.PropTypes.object
    
  shouldComponentUpdate: (new_props, new_state)->
   return (!_.isEqual(@props, new_props)) || @param_changed('ev', @state, new_state)
    
  form_name: 'electric_vehicle'
  
  manual_input_t: ()->
    I18n.t('electric_vehicle.entry_type.manual_opt') 
    
  ev_list: ()->
    _.map @state.ev_list, (ev)=>
        ev.name
    
  form_change: (event)->
    field = _.replace(event.target.id, "#{@form_name}_", '')
    new_state = {}
    new_state[field] = event.target.value
    if field == 'ev'
      new_ev = _.find @state.ev_list, (ev)->
        ev.name == new_state.ev
      new_state.battery_capacity = new_ev.battery_capacity
      new_state.charging_power = new_ev.charging_power
      new_state.consumption = new_ev.consumption
    @setState new_state
  
  submit: (event)->
    $('#stv_main_form').trigger 'submit_form', [@form_name, @state]
    
  choose_input_method: (ev)->
    return false if ev == ''
    return @render_ev_params() if ev == @manual_input_t()
    @render_ev_list()
    
  render_form: ()->
    `<div className='well form-content text-center'>
      <form id={ this.form_element_name() } className='form_horizontal'>
        <SelectField values={ this.ev_list() } selected_value={ this.state.ev } form_name={ this.form_name } field_name='ev' is_required={ true } on_change={ this.form_change } dont_translate={ true }/>
        { this.choose_input_method(this.state.ev) }
        <div className='text-left'>
          <SubmitButton form={ this.form_element_id() } on_click={ this.submit } />
        </div>
      </form>
     </div>`
   
  render_ev_list: ()->
    `<div>
      <TextFieldReadonly value={ this.state.battery_capacity } form_name={ this.form_name } field_name='battery_capacity' field_type='number' />
      <TextFieldReadonly value={ this.state.charging_power } form_name={ this.form_name } field_name='charging_power' field_type='number' />
      <TextFieldReadonly value={ this.state.consumption } form_name={ this.form_name } field_name='consumption' field_type='number' />
     </div>`
  
  render_ev_params: ()->
    `<div>
      <TextField value={ this.state.battery_capacity } form_name={ this.form_name } field_name='battery_capacity' type='number' is_required={ true } on_change={ this.form_change } />
      <TextField value={ this.state.charging_power } form_name={ this.form_name } field_name='charging_power' type='number' is_required={ true } on_change={ this.form_change } />
      <TextField value={ this.state.consumption } form_name={ this.form_name } field_name='consumption' type='number' is_required={ true } on_change={ this.form_change } />
    </div>`
 
  render: ->
    `<div>
      { this.render_header_and_form_according_to_status(this.render_form) }
     </div>`

    
