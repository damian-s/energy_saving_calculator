@FormSwitcher = class FormSwitcher

  FORMS: ['pv_system', 'electric_vehicle', 'charging_behavior', 'electricity_consumption', 'result']
  
  constructor: (@initial_state, @form_name)->
    @new_state = @initial_state
    
#  set_new_state_data: (new_state_data)->
#    @new_state = _.merge(@new_state, { "#{@form_name}": new_state_data })
#    return @
    
  edit: (form_name=@form_name)->
    @set_status('edit', form_name)
  
  hide: (form_name=@form_name)->
    @set_status('hidden', form_name)
  
  accept: (form_name=@form_name)->
    @set_status('accepted', form_name)
    
  set_status: (status, form_name)->
    @new_state = _.merge(@new_state, { "#{form_name}": { status: status } })
    return @
    
  toggle_acceptance: ()->
    if @new_state[@form_name].status == 'accepted'
      @edit()
    else
      @accept()
  
  show_next: ()->
    if @next_state_name()
      @edit(@next_state_name())
    return @

  get_new_state: ()->
    @hide_all_after_editable()
    @new_state

  hide_all_after_editable: ()->
    editable_found = false
    for i in [@current_state_index()..(@FORMS.length-1)]
      if editable_found
        @hide(@FORMS[i])
      if @new_state[@FORMS[i]].status == 'edit'
        editable_found = true

  next_state_name: ()->
    @FORMS[@next_state_index()] || false
    
  next_state_index: ()->
    @current_state_index() + 1
    
  current_state_index: ()->
    _.findIndex @FORMS,(f)=>
      @form_name == f
    
  