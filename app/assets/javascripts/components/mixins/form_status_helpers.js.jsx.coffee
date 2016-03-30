@FormStatusHelpers = {

  form_element_name: ()->
    "#{@form_name}_form"
    
  form_element_id: ()->
    "##{@form_element_name()}"
    
  form_header_id: ()->
    "##{@form_header_name()}"
    
  form_header_name: ()->
    "#{@form_name}_header"

  getInitialState: ()->
    @props.form_settings
    
  componentWillReceiveProps: (new_props)->
    @setState new_props.form_settings

  render_header_and_form_according_to_status: (render_form_func, render_header_func=@render_header)->
    if @is_current_form_displayed()
      `<div className='col-md-12'>
        <FormHeader form_name={ this.form_name } acceptance={ this.is_current_form_accepted() } />
        { this.is_current_form_editable() ? this.render_form() : false }
      </div>`
      
  render_header: ()->
    `<FormHeader form_name={ this.form_name } acceptance={ this.is_current_form_accepted() } />`

  is_child_form_hidden: (form_name)->
    @state[form_name].status == 'hidden'
    
  is_current_form_hidden: ()->
    @state.status == 'hidden'
    
  is_child_form_displayed: (form_name)->
    @state[form_name].status != 'hidden'
    
  is_current_form_displayed: ()->
    @state.status != 'hidden'
    
  is_child_form_accepted: (form_name)->
    @state[form_name].status == 'accepted'
    
  is_current_form_accepted: ()->
    @state.status == 'accepted'
    
  is_child_form_editable: (form_name)->
    @state[form_name].status == 'edit'
    
  is_current_form_editable: ()->
    @state.status == 'edit'

}