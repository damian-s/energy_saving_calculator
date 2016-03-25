@PvSystem = React.createClass
  
  mixins: [ FormStatusHelpers ]
  
  propTypes:
    form_settings: React.PropTypes.object
    
  form_name: 'pv_system'
  
  location: ()->
    @state.location
    
  power: ()->
    @state.power
    
  date: ()->
    @state.date
    
  status: ()->
    @state.status
  
  form_change: (event)->
    field = _.replace(event.target.id, "#{@form_name}_", '')
    new_state = {}
    new_state[field] = event.target.value
    @setState new_state
    
  submit: ()->
    $('#stv_main_form').trigger 'submit_form', [@form_name, @state]
    
  render_form: ()->
    `<div className='well form-content text-center'>
      <form id='pv_system_form' className='form_horizontal' data-toggle='validator' role='form'>
        <TextField value={ this.location() } form_name={ this.form_name } field_name='location' type='text' is_required={ true } on_change={ this.form_change } />
        <TextField value={ this.power() } form_name={ this.form_name } field_name='power' type='number' is_required={ true } on_change={ this.form_change } />
        <DateField value={ this.date() } form_name={ this.form_name } field_name='date' is_required={ true } on_change={ this.form_change } />
        <button type='button' className='btn btn-default' onClick={ this.submit }>{ I18n.t('submit') }</button>
      </form>
     </div>`
    
  render: ->
    `<div className='col-md-12'>
      { this.render_header_and_form_according_to_status(this.render_form) }
     </div>`

