@EvParams= React.createClass
  
  propTypes:
    form_settings: React.PropTypes.object
    on_change: React.PropTypes.func
    submit: React.PropTypes.func
    
  getInitialState: ()->
    @props.form_settings
    
  form_name: 'ev_params'
  
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
    @setState new_state
    
  submit: (event)->
    @props.submit(event, @state)
    
  render: ->
    `<div>
      <TextField value={ this.battery_capacity() } form_name={ this.form_name } field_name='battery_capacity' type='number' is_required={ true } on_change={ this.form_change } />
      <TextField value={ this.charging_power() } form_name={ this.form_name } field_name='charging_power' type='number' is_required={ true } on_change={ this.form_change } />
      <TextField value={ this.consumption() } form_name={ this.form_name } field_name='consumption' type='number' is_required={ true } on_change={ this.form_change } />
      <button id={ this.form_name } type='button' className='btn btn-default' onClick={ this.submit }>{ I18n.t('submit') }</button>
    </div>`
    
