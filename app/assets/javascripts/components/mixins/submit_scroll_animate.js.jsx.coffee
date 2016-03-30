@SubmitScrollAnimate = {

  componentDidUpdate: ()->
    @move_to_active()
    
  componentDidMount: ()->
    if (@form_name != 'pv_system')
      @move_to_active()
    
  move_to_active: ()->
    if @is_current_form_editable()
      $('html, body').animate
        scrollTop: $(@form_header()).offset().top
      , 1500

  form_header: ()->
    "##{@form_name}_header"

}