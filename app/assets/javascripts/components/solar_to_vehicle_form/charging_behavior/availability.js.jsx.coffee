@Availability = React.createClass

  propTypes:
    form_settings: React.PropTypes.object
    
  getInitialState: ()->
    @props.form_settings
    
  form_name: 'availability'
  
  form_change: (event)->
    field = _.replace(event.target.id, "#{@form_name}_", '')
    new_state = {}
    new_state[field] = event.target.value
    @setState new_state
    
  submit: (event)->
    @props.submit(event, @state.timeslots)
    
  add_availability: ()->
    ts = @state.timeslots || []
    ts.push { start: @state.hour_start , stop: @state.hour_stop, type: @state.selected_type }
    @setState { timeslots: ts }
    
  delete_availability: (index)->
    new_timeslots = @state.timeslots
    new_timeslots.splice(index, 1)
    @setState { timeslots: new_timeslots }
    
  assign_timerange: (event, timerange)->
    @setState {hour_start: timerange[0], hour_stop: timerange[1]}
  
  render: ->
    `<div className='col-md-12'>
      <div className='text-center'>
        <h4> { I18n.t('charging_behavior.enter_availability') } </h4>
      </div>
      <div className='row text-center'>
        <SelectField values={ this.state.types } selected_value={ this.state.selected_type } form_name={ this.form_name } field_name='selected_type' is_required={ true } on_change={ this.form_change } />
        <br />
        <HourSliderField form_name={ this.form_name } field_name='timeslot_timerenge' on_change={ this.assign_timerange } />
        <button type='button' className='btn btn-default' onClick={ this.add_availability }>{ I18n.t('availability.add') }</button>
        <AvailabilityTable table_data={ this.state.timeslots } on_delete={ this.delete_availability } />
      </div>
    </div>`
    
