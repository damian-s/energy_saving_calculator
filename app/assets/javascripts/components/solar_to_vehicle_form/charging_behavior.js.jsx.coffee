@ChargingBehavior = React.createClass

  mixins: [ FormStatusHelpers ]

  propTypes:
    form_settings: React.PropTypes.object
    
  shouldComponentUpdate: (new_props, new_state)->
    true
    
  form_name: 'charging_behavior'
  
  form_change: (event)->
    field = _.replace(event.target.id, "#{@form_name}_", '')
    @setState { "#{field}": event.target.value }
    
  submit: (event, params)->
    $('#stv_main_form').trigger 'submit_form', [@form_name, @state]
    
  render_form: ->
    `<div className='well form-content text-center'>
      <form id='charging_behavior_form' className='form_horizontal' data-toggle='validator' role='form'>
        <TextField value={ this.state.average_capacity_at_start } form_name={ this.form_name } field_name='average_capacity_at_start' type='number' is_required={ true } on_change={ this.form_change } />
        <TextField value={ this.state.average_daily_driving_distance } form_name={ this.form_name } field_name='average_daily_driving_distance' type='number' is_required={ true } on_change={ this.form_change } />
        <Availability form_settings={ this.state.availabilities } />
        <button type='button' className='btn btn-default' onClick={ this.submit }>{ I18n.t('submit') }</button>
      </form>
    </div>`
    
  render: ->
    `<div className='col-md-12'>
      { this.render_header_and_form_according_to_status(this.render_form) }
     </div>`