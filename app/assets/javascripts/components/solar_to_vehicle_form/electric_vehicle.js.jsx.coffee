@ElectricVehicle = React.createClass
  
  propTypes:
    form_settings: React.PropTypes.object
    
  getInitialState: ()->
    @props.form_settings
    
  form_name: 'electric_vehicle'
  
  entry_type: ()->
    @state.entry_type
    
  entry_type_values: ()->
    @state.entry_type_values
    
  ev_params: ()->
    @state.ev_params
  
  ev_list_params: ()->
    @state.ev_list
    
  form_change: (event)->
    field = _.replace(event.target.id, "#{@form_name}_", '')
    new_state = {}
    new_state[field] = event.target.value
    @setState new_state
  
  submit: (event, params)->
    console.log params
    @setState {electric_vehicle_result: params}
    console.log @state
    
  render: ->
    `<div className='col-md-12'>
      <div className='well text-center'>
        <h4> { I18n.t('electric_vehicle.title') } </h4>
      </div>
      <div className='well'>
        <form id='electric_vehicle_form' className='form_horizontal' data-toggle='validator' role='form'>
          <SelectField values={ this.entry_type_values() } selected_value={ this.entry_type() } form_name={ this.form_name } field_name='entry_type' is_required={ true } on_change={ this.form_change } />
          { this.entry_type() == 'from_list' ? <EvList form_settings={this.ev_list_params()} on_change={ this.form_change } submit={ this.submit }/> : false}
          { this.entry_type() == 'manual' ? <EvParams form_settings={this.ev_params()} on_change={ this.form_change } submit={ this.submit }/> : false}
        </form>
      </div>
    </div>`
    
