@Availability = React.createClass

  propTypes:
    form_settings: React.PropTypes.object
    on_change: React.PropTypes.func
    
  getInitialState: ()->
    @props.form_settings
    
  form_name: 'availability'
  
  form_change: (event)->
    field = _.replace(event.target.id, "#{@form_name}_", '')
    new_state = {}
    new_state[field] = event.target.value
    @setState new_state
    
  add_availability: ()->
    ts = _.filter (@state.timeslots || []), (ts)=>
      ts.type == @state.selected_type
    new_availability = { start: @state.hour_start , stop: @state.hour_stop, type: @state.selected_type }
    @check_if_availability_valid ts, new_availability, ()=>
      all_ts = _.clone @state.timeslots
      all_ts.push new_availability
      @setState { timeslots: all_ts }, ()=>
        @props.on_change @state
    , ()=>
      @show_error = true
      @forceUpdate()
      
  hide_error: ()->
    @show_error = false
      
  check_if_availability_valid: ( timeslots, availability, success_func, fail_func)->
    valid = true
    nav = @availability_to_minutes(availability)
    _.forEach timeslots, (current_availability)=>
      return if !valid
      cav = @availability_to_minutes(current_availability)
      if @availabilites_cross(cav, nav)
        valid = false
    if valid 
      success_func()
    else
      fail_func()
      
  availability_to_minutes: (a)->
    {
      start: @hour_to_minutes(a.start)
      stop: @hour_to_minutes(a.stop)
      type: a.type
    }
    
  hour_to_minutes: (h)->
    h_arr = h.split(':')
    (parseInt(h_arr[0]) * 60) + parseInt(h_arr[1])
    
  availabilites_cross: (old_a, new_a)->
    (((new_a.start >= old_a.start) && (new_a.start <= old_a.stop)) ||
    ((new_a.stop >= old_a.start) && (new_a.stop <= old_a.stop)) ||
    (( new_a.start <= old_a.start ) && ( new_a.stop >= old_a.stop )))
    
  delete_availability: (ts)->
    new_timeslots = _.reject( @state.timeslots, ts )
    @setState { timeslots: new_timeslots }, ()=>
      @props.on_change(@state)
    
  assign_timerange: (event, timerange)->
    @setState {hour_start: timerange[0], hour_stop: timerange[1]}
  
  render_timeslots_missing: ()->
    `<div className='well error-well'>
      { I18n.t('err.timeslots_missing') }
    </div>`
    
  timeslots: ()->
    _.sortBy @state.timeslots, (ts)->
      ts.start
    
  weekend_timeslots: ()->
    _.filter @timeslots(), (ts)->
      ts.type == 'weekend'
    
  weekday_timeslots: ()->
    _.filter @timeslots(), (ts)->
      ts.type == 'weekday'
  
  render: ->
    `<div className='col-md-12'>
      <div className='text-center'>
        <h4> { I18n.t('charging_behavior.enter_availability') } </h4>
      </div>
      <div className='row text-center'>
        <SelectField values={ this.state.types } selected_value={ this.state.selected_type } form_name={ this.form_name } field_name='selected_type' is_required={ false } on_change={ this.form_change } />
        <br />
        <HourSliderField form_name={ this.form_name } field_name='timeslot_timerenge' on_change={ this.assign_timerange } />
        <button type='button' className='btn btn-default' onClick={ this.add_availability }>{ I18n.t('availability.add') }</button>
        <br />
        { this.show_error ? <ErrorMessage message={ I18n.t('charging_behavior.timeslots_cross_error') } on_show={ this.hide_error } /> : false}
        <br />
        <div className='col-md-6 text-center'>
          { (this.weekday_timeslots().length == 0) ? <ErrorMessage message={ I18n.t('err.timeslots_missing') } /> : <AvailabilityTable header={ I18n.t('availability_table.weekdays_title') } table_data={ this.weekday_timeslots() } on_delete={ this.delete_availability } /> }
        </div>
        <div className='col-md-6 text-center'>
          { (this.weekend_timeslots().length == 0) ? <ErrorMessage message={ I18n.t('err.timeslots_missing') } /> : <AvailabilityTable header={ I18n.t('availability_table.weekends_title') } table_data={ this.weekend_timeslots() } on_delete={ this.delete_availability } /> }
        </div>  
      </div>
    </div>`
    
