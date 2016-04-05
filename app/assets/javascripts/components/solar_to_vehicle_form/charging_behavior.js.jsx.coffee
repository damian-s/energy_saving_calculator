@ChargingBehavior = React.createClass

  mixins: [ FormStatusHelpers, SubmitScrollAnimate ]

  propTypes:
    form_settings: React.PropTypes.object
    
  shouldComponentUpdate: (new_props, new_state)->
    return (!_.isEqual(@props, new_props)) || @param_changed('timeslots', @state.availabilities, new_state.availabilities)
    
  form_name: 'charging_behavior'
  
  form_change: (event)->
    field = _.replace(event.target.id, "#{@form_name}_", '')
    @setState { "#{field}": event.target.value }
    
  availability_change: (new_availabilities)->
    @setState { availabilities: new_availabilities }
    
  submit: (event, params)->
    this.availability_ref
    if @timeslots_are_set()
      $('#stv_main_form').trigger 'submit_form', [@form_name, @state]
  
  timeslots_are_set: ()->
    @timeslot_set('weekday') && @timeslot_set('weekend')
    
  timeslot_set: (type)->
    _.findIndex(@state.availabilities.timeslots, ['type', type]) >= 0
  
   capacity_steps: ()->
    (x for x in [0..100] by 5)
    
   distance_steps: ()->
    (x for x in [0..1000] by 5)
    
  render_form: ->
    `<div className='well form-content text-center'>
      <form id={ this.form_element_name() } className='form_horizontal'>
        <SelectField values={ this.capacity_steps() } selected_value={ this.state.average_capacity_at_start } form_name={ this.form_name } field_name='average_capacity_at_start' is_required={ true } on_change={ this.form_change } dont_translate={ true }/>
        <SelectField values={ this.distance_steps() } selected_value={ this.state.average_daily_driving_distance } form_name={ this.form_name } field_name='average_daily_driving_distance' is_required={ true } on_change={ this.form_change } dont_translate={ true }/>
        <Availability form_settings={ this.state.availabilities } on_change={ this.availability_change } />
        <div className='text-left'>
          <SubmitButton form={ this.form_element_id() } on_click={ this.submit } />
        </div>
      </form>
    </div>`
    
  render: ->
    `<div>
      { this.render_header_and_form_according_to_status(this.render_form) }
     </div>`