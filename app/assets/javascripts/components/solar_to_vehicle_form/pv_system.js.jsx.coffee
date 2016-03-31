@PvSystem = React.createClass
  
  mixins: [ FormStatusHelpers, SubmitScrollAnimate ]
  
  propTypes:
    form_settings: React.PropTypes.object
    
  shouldComponentUpdate: (new_props, new_state)->
    return !_.isEqual(@props, new_props)
    
  form_name: 'pv_system'
  
  form_change: (event)->
    field = _.replace(event.target.id, "#{@form_name}_", '')
    @setState { "#{field}": event.target.value }
    
  submit: ()->
    $('#stv_main_form').trigger 'submit_form', [@form_name, @state]
    
  render_form: ()->
    `<div className='well form-content text-center'>
      <form id={ this.form_element_name() } className='form_horizontal'>
        <SelectField values={ this.state.location_values } selected_value={ this.state.location } form_name={ this.form_name } field_name='location' is_required={ true } on_change={ this.form_change } dont_translate={ true } />
        <TextField value={ this.state.power } form_name={ this.form_name } field_name='power' type='number' is_required={ true } on_change={ this.form_change } />
        <DateField value={ this.state.date } form_name={ this.form_name } field_name='date' is_required={ true } on_change={ this.form_change } />
        <div className='text-left'>
          <SubmitButton form={ this.form_element_id() } on_click={ this.submit } />
        </div>
      </form>
     </div>`
    
  render: ->
    `<div>
      { this.render_header_and_form_according_to_status(this.render_form) }
     </div>`

