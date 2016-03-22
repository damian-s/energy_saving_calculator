@Availability = React.createClass

  propTypes:
    form_settings: React.PropTypes.object
    
  getInitialState: ()->
    @props.form_settings
    
  form_name: 'availability'
  
  timeslots: ()->
    @state.timeslots
    
  types: ()->
    @state.types
    
  selected_type: ()->
    @state.selected_type
  
  form_change: (event)->
    field = _.replace(event.target.id, "#{@form_name}_", '')
    new_state = {}
    new_state[field] = event.target.value
    console.log new_state
    @setState new_state
    
  submit: (event)->
    @props.submit(event, @state.timeslots)
    
  add_availability: ()->
    ts = @state.timeslots || []
    ts.push { start: @state.hour_start , stop: @state.hour_stop, type: @state.selected_type }
    @setState { timeslots: ts }
    
  render: ->
    `<div className='col-md-12'>
      <div className='text-center'>
        <h4> { I18n.t('charging_behavior.enter_availability') } </h4>
      </div>
      <div className='row'>
        <SelectField values={ this.types() } selected_value={ this.selected_type() } form_name={ this.form_name } field_name='selected_type' is_required={ true } on_change={ this.form_change } />
        <DateField form_name={ this.form_name } field_name='hour_start' is_required={ true } on_change={ this.form_change } type='hour'/>
        <DateField form_name={ this.form_name } field_name='hour_stop' is_required={ true } on_change={ this.form_change } type='hour' />
        <AvailabilityTable table_data={ this.timeslots() } />
        <button type='button' className='btn btn-default' onClick={ this.add_availability }>{ I18n.t('add_availability') }</button>
      </div>
    </div>`
    
