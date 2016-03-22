@PvSystem = React.createClass
  
  propTypes:
    form_settings: React.PropTypes.object
    
  getInitialState: ()->
    @props.form_settings
    
  form_name: 'pv_system'
  
  location: ()->
    @state.location
    
  power: ()->
    @state.power
    
  date: ()->
    @state.date
  
  form_change: (event)->
    field = _.replace(event.target.id, "#{@form_name}_", '')
    new_state = {}
    new_state[field] = event.target.value
    @setState new_state
    
  submit: ()->
    console.log @state
    
  render: ->
    `<div className='col-md-12'>
      <div className='well text-center'>
        <h4> { I18n.t('pv_system.title') } </h4>
      </div>
      <div className='well'>
        <form id='pv_system_form' className='form_horizontal' data-toggle='validator' role='form'>
          <TextField value={ this.location() } form_name={ this.form_name } field_name='location' type='text' is_required={ true } on_change={ this.form_change } />
          <TextField value={ this.power() } form_name={ this.form_name } field_name='power' type='number' is_required={ true } on_change={ this.form_change } />
          <DateField value={ this.date() } form_name={ this.form_name } field_name='date' is_required={ true } on_change={ this.form_change } />
          <button type='button' className='btn btn-default' onClick={ this.submit }>{ I18n.t('submit') }</button>
        </form>
      </div>
    </div>`
    
