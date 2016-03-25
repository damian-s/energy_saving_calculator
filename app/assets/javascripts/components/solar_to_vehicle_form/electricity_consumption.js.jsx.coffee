@ElectricityConsumption = React.createClass
  
  mixins: [ FormStatusHelpers ]
  
  propTypes:
    form_settings: React.PropTypes.object
    
  form_name: 'electricity_consumption'
    
  at_home_on_weekdays: ()->
    @state.at_home_on_weekdays
    
  at_home_on_weekdays_values: ()->
    @state.at_home_on_weekdays_values
    
  yearly_consumption: ()->
    @state.yearly_consumption
    
  yearly_consumption_values: ()->
    @state.yearly_consumption_values
    
  electricity_price: ()->
    @state.electricity_price
    
  yearly_consumption_kwh: ()->
    @state.yearly_consumption_kwh
    
  people_no: ()->
    @state.people_no
  
  form_change: (event)->
    field = _.replace(event.target.id, "#{@form_name}_", '')
    new_state = {}
    new_state[field] = event.target.value
    @setState new_state
    
  submit: (event)->
    $('#stv_main_form').trigger 'submit_form', [@form_name, @state]
  
  render_form: ->
      `<div className='well form-content text-center'>
        <form id='electricity_consumption_form' className='form_horizontal' data-toggle='validator' role='form'>
          <SelectField values={ this.at_home_on_weekdays_values() } selected_value={ this.at_home_on_weekdays() } form_name={ this.form_name } field_name='at_home_on_weekdays' is_required={ true } on_change={ this.form_change } />
          <SelectField values={ this.yearly_consumption_values() } selected_value={ this.yearly_consumption() } form_name={ this.form_name } field_name='yearly_consumption' is_required={ true } on_change={ this.form_change } />
          { this.yearly_consumption() == 'enter_value' ? <TextField value={ this.yearly_consumption_kwh() } form_name={ this.form_name } field_name='yearly_consumption_kwh' type='number' is_required={ true } on_change={ this.form_change } /> : false}
          { this.yearly_consumption() == 'enter_people_no' ? <TextField value={ this.people_no() } form_name={ this.form_name } field_name='people_no' type='number' is_required={ true } on_change={ this.form_change } /> : false}
          <TextField value={ this.electricity_price() } form_name={ this.form_name } field_name='electricity_price' type='number' is_required={ true } on_change={ this.form_change } />
          <button type='button' className='btn btn-default' onClick={ this.submit }>{ I18n.t('submit') }</button>
        </form>
      </div>`
    
  render: ->
    `<div className='col-md-12'>
      { this.render_header_and_form_according_to_status(this.render_form) }
     </div>`