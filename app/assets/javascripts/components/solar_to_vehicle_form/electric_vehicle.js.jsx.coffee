@ElectricVehicle = React.createClass
  
  mixins: [ FormStatusHelpers, SubmitScrollAnimate ]
  
  propTypes:
    form_settings: React.PropTypes.object
    
  shouldComponentUpdate: (new_props, new_state)->
    return (!_.isEqual(@props, new_props)) || @param_changed('entry_type', @state, new_state) || @param_changed('ev', @state, new_state)
    
  form_name: 'electric_vehicle'
    
  ev_list: ()->
    _.map @state.ev_list, (ev)->
      ev.name
    
  form_change: (event)->
    field = _.replace(event.target.id, "#{@form_name}_", '')
    new_state = {}
    new_state[field] = event.target.value
    if field == 'ev'
      new_state.ev_data = _.find @state.ev_list, (ev)->
        ev.name == new_state.ev
    @setState new_state
  
  submit: (event)->
    $('#stv_main_form').trigger 'submit_form', [@form_name, @state]
    
  render_form: ()->
    `<div className='well form-content text-center'>
      <form id={ this.form_element_name() } className='form_horizontal'>
        <SelectField values={ this.state.entry_type_values } selected_value={ this.state.entry_type } form_name={ this.form_name } field_name='entry_type' is_required={ true } on_change={ this.form_change } />
        { this.state.entry_type == 'from_list' ? this.render_ev_list() : false}
        { this.state.entry_type == 'manual' ? this.render_ev_params() : false}
        <div className='text-left'>
          <SubmitButton form={ this.form_element_id() } on_click={ this.submit } />
        </div>
      </form>
     </div>`
   
  render_ev_list: ()->
    `<div>
      <SelectField values={ this.ev_list() } selected_value={ this.state.ev } form_name={ this.form_name } field_name='ev' is_required={ true } on_change={ this.form_change } dont_translate={ true }/>
      <TextFieldReadonly value={ this.state.ev_data.battery_capacity } form_name={ this.form_name } field_name='battery_capacity' field_type='number' />
      <TextFieldReadonly value={ this.state.ev_data.charging_power } form_name={ this.form_name } field_name='charging_power' field_type='number' />
      <TextFieldReadonly value={ this.state.ev_data.consumption } form_name={ this.form_name } field_name='consumption' field_type='number' />
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

    
