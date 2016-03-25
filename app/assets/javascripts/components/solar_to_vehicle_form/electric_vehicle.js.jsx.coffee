@ElectricVehicle = React.createClass
  
  mixins: [ FormStatusHelpers ]
  
  propTypes:
    form_settings: React.PropTypes.object
    
  form_name: 'electric_vehicle'
  
  entry_type: ()->
    @state.entry_type
    
  entry_type_values: ()->
    @state.entry_type_values
    
  ev_list: ()->
    _.map @state.ev_list, (ev)->
      ev.name
    
  ev: ()->
    @state.ev
    
  ev_data: ()->
    @state.ev_data
    
  battery_capacity: ()->
    @state.battery_capacity
    
  charging_power: ()->
    @state.charging_power
    
  consumption: ()->
    @state.consumption
    
  form_change: (event)->
    field = _.replace(event.target.id, "#{@form_name}_", '')
    new_state = {}
    new_state[field] = event.target.value
    if field == 'ev'
      new_state.ev_data = _.find @state.ev_list, (ev)->
        ev.name == new_state.ev
    console.log new_state
    @setState new_state
  
  submit: (event)->
    $('#stv_main_form').trigger 'submit_form', [@form_name, @state]
    
  render_form: ()->
    `<div className='well form-content text-center'>
      <form id='electric_vehicle_form' className='form_horizontal' data-toggle='validator' role='form'>
        <SelectField values={ this.entry_type_values() } selected_value={ this.entry_type() } form_name={ this.form_name } field_name='entry_type' is_required={ true } on_change={ this.form_change } />
        { this.entry_type() == 'from_list' ? this.render_ev_list() : false}
        { this.entry_type() == 'manual' ? this.render_ev_params() : false}
        <button type='button' className='btn btn-default' onClick={ this.submit }>{ I18n.t('submit') }</button>
      </form>
     </div>`
   
  render_ev_list: ()->
    `<div>
      <SelectField values={ this.ev_list() } selected_value={ this.ev() } form_name={ this.form_name } field_name='ev' is_required={ true } on_change={ this.form_change } />
      <TextFieldReadonly value={ this.ev_data().battery_capacity } form_name={ this.form_name } field_name='battery_capacity' field_type='number' />
      <TextFieldReadonly value={ this.ev_data().charging_power } form_name={ this.form_name } field_name='charging_power' field_type='number' />
      <TextFieldReadonly value={ this.ev_data().consumption } form_name={ this.form_name } field_name='consumption' field_type='number' />
     </div>`
  
  render_ev_params: ()->
    `<div>
      <TextField value={ this.battery_capacity() } form_name={ this.form_name } field_name='battery_capacity' type='number' is_required={ true } on_change={ this.form_change } />
      <TextField value={ this.charging_power() } form_name={ this.form_name } field_name='charging_power' type='number' is_required={ true } on_change={ this.form_change } />
      <TextField value={ this.consumption() } form_name={ this.form_name } field_name='consumption' type='number' is_required={ true } on_change={ this.form_change } />
    </div>`
 
  render: ->
    `<div className='col-md-12'>
      { this.render_header_and_form_according_to_status(this.render_form) }
     </div>`

    
