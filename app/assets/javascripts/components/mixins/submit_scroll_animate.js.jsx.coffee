@SubmitScrollAnimate = {

  componentDidUpdate: (prevProps, prevState)->
    if (prevProps.form_settings.status == 'accepted') && @is_current_form_editable()
      @move_to_active()
    

  componentDidMount: ()->
    if (@form_name != 'pv_system') && @is_current_form_editable()
      @move_to_active()
    
  move_to_active: ()->
    $('html, body').animate
      scrollTop: $(@form_header_id()).offset().top
    , 1500

}