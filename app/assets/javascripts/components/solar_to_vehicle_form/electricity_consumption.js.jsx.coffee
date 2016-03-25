@ElectricityConsumption = React.createClass
  
  mixins: [ FormStatusHelpers ]
  
  propTypes:
    form_settings: React.PropTypes.object
    
  shouldComponentUpdate: (new_props, new_state)->
    true
    
  form_name: 'electricity_consumption'
  
  form_change: (event)->
    field = _.replace(event.target.id, "#{@form_name}_", '')
    @setState { "#{field}": event.target.value }
    
  submit: (event)->
    $('#stv_main_form').trigger 'submit_form', [@form_name, @state]
  
  render_form: ->
      `<div className='well form-content text-center'>
        <form id='electricity_consumption_form' className='form_horizontal' data-toggle='validator' role='form'>
          <SelectField values={ this.state.at_home_on_weekdays_values } selected_value={ this.state.at_home_on_weekdays } form_name={ this.form_name } field_name='at_home_on_weekdays' is_required={ true } on_change={ this.form_change } />
          <SelectField values={ this.state.yearly_consumption_values } selected_value={ this.state.yearly_consumption } form_name={ this.form_name } field_name='yearly_consumption' is_required={ true } on_change={ this.form_change } />
          { this.state.yearly_consumption == 'enter_value' ? <TextField value={ this.state.yearly_consumption_kwh } form_name={ this.form_name } field_name='yearly_consumption_kwh' type='number' is_required={ true } on_change={ this.form_change } /> : false}
          { this.state.yearly_consumption == 'enter_people_no' ? <TextField value={ this.state.people_no } form_name={ this.form_name } field_name='people_no' type='number' is_required={ true } on_change={ this.form_change } /> : false}
          <TextField value={ this.state.electricity_price } form_name={ this.form_name } field_name='electricity_price' type='number' is_required={ true } on_change={ this.form_change } />
          <button type='button' className='btn btn-default' onClick={ this.submit }>{ I18n.t('submit') }</button>
        </form>
      </div>`
    
  render: ->
    `<div className='col-md-12'>
      { this.render_header_and_form_according_to_status(this.render_form) }
     </div>`