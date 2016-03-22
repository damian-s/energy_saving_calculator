@ChargingBehavior = React.createClass

  propTypes:
    form_settings: React.PropTypes.object
    
  getInitialState: ()->
    @props.form_settings
    
  form_name: 'charging_behavior'
  
  average_capacity_at_start: ()->
    @state.average_capacity_at_start
    
  average_daily_driving_distance: ()->
    @state.average_daily_driving_distance
    
  availabilities: ()->
    @state.availabilities
  
  form_change: (event)->
    field = _.replace(event.target.id, "#{@form_name}_", '')
    new_state = {}
    new_state[field] = event.target.value
    @setState new_state
    
  submit: (event, params)->
    console.log params
    
  render: ->
    `<div className='col-md-12'>
      <div className='well text-center form-header'>
        <h4> { I18n.t('charging_behavior.title') } </h4>
      </div>
      <div className='well form-content'>
        <form id='charging_behavior_form' className='form_horizontal' data-toggle='validator' role='form'>
          <TextField value={ this.average_capacity_at_start() } form_name={ this.form_name } field_name='average_capacity_at_start' type='number' is_required={ true } on_change={ this.form_change } />
          <TextField value={ this.average_daily_driving_distance() } form_name={ this.form_name } field_name='average_daily_driving_distance' type='number' is_required={ true } on_change={ this.form_change } />
          <Availability form_settings={ this.availabilities() } submit={ this.submit }/>
          <button type='button' className='btn btn-default' onClick={ this.submit }>{ I18n.t('submit') }</button>
        </form>
      </div>
    </div>`
    
