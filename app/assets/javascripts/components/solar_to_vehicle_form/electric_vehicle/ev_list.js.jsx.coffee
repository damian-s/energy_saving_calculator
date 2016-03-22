@EvList= React.createClass
    
  propTypes:
    form_settings: React.PropTypes.object
    on_change: React.PropTypes.func
    submit: React.PropTypes.func
    
  getInitialState: ()->
    @props.form_settings
    
  form_name: 'ev_list'
  
  evs: ()->
    _.map @state.evs, (ev)->
      ev.name
    
  selected_ev: ()->
    @state.selected_ev.name
    
  selected_ev_params: (param_name)->
    @state.selected_ev[param_name]
    
  form_change: (event)->
    field = _.replace(event.target.id, "#{@form_name}_", '')
    new_state = {}
    new_ev = _.find @state.evs, (ev)->
      ev.name == event.target.value
    new_state[field] = new_ev
    @setState new_state
    
  submit: (event)->
    @props.submit(event, @state.selected_ev)
    
  render: ->
    `<div>
      <SelectField values={ this.evs() } selected_value={ this.selected_ev() } form_name={ this.form_name } field_name='selected_ev' is_required={ true } on_change={ this.form_change } />
      <span> capacity: { this.selected_ev_params('battery_capacity') } </span>
      <span> power: { this.selected_ev_params('charging_power') } </span>
      <span> consumption: { this.selected_ev_params('consumption') } </span>
      <button id={ this.form_name } type='button' className='btn btn-default' onClick={ this.submit }>{ I18n.t('submit') }</button>
    </div>`