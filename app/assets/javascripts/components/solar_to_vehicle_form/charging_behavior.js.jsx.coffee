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
    
  submit: (event, params)->
    if this.state.availabilities.timeslots.length > 0
      $('#stv_main_form').trigger 'submit_form', [@form_name, @state]
    
  render_form: ->
    `<div className='well form-content text-center'>
      <form id={ this.form_element_name() } className='form_horizontal'>
        <TextField value={ this.state.average_capacity_at_start } form_name={ this.form_name } field_name='average_capacity_at_start' type='number' is_required={ true } on_change={ this.form_change } />
        <TextField value={ this.state.average_daily_driving_distance } form_name={ this.form_name } field_name='average_daily_driving_distance' type='number' is_required={ true } on_change={ this.form_change } />
        <Availability form_settings={ this.state.availabilities } />
        <div className='text-left'>
          <SubmitButton form={ this.form_element_id() } on_click={ this.submit } />
        </div>
      </form>
    </div>`
    
  render: ->
    `<div>
      { this.render_header_and_form_according_to_status(this.render_form) }
     </div>`