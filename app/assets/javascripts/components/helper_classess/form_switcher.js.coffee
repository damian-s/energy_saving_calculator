@FormSwitcher = class FormSwitcher

  FORMS: ['pv_system', 'electric_vehicle', 'charging_behavior', 'electricity_consumption', 'result']
  INITIAL_MASK: { pv_system: {}, electric_vehicle: {}, charging_behavior: {}, electricity_consumption: {}, result: {} }
  
  constructor: (initial_state, @form_name)->
    @initial_state = _.cloneDeep initial_state
    @mask = @INITIAL_MASK
    @current_state_index = _.findIndex @FORMS,(f)=>
      @form_name == f
    @next_state_index = @current_state_index + 1
    @next_state_name = @FORMS[@next_state_index] || false
    
  set_new_state_data: (new_state_data)->
    data = _.cloneDeep new_state_data
    @mask = _.merge(@mask, { "#{@form_name}": data })
    return @

  edit: (form_name=@form_name)->
    @set_status('edit', form_name)
  
  hide: (form_name=@form_name)->
    @set_status('hidden', form_name)
  
  accept: (form_name=@form_name)->
    @set_status('accepted', form_name)
    
  set_status: (status, form_name)->
    @mask = _.merge(@mask, { "#{form_name}": { status: status } })
    return @
    
  toggle_acceptance: ()->
    if @initial_state[@form_name].status == 'accepted'
      @edit()
    else
      @accept()
  
  edit_next: ()->
    if @next_state_name
      @edit(@next_state_name)
      @hide_all_after_editable()
    return @

  get_new_state: ()->
    _.merge(@initial_state, @mask)

  hide_all_after_editable: ()->
    editable_found = false
    for i in [0..(@FORMS.length-1)]
      if ( (@mask[@FORMS[i]].status == 'edit') && !editable_found )
        editable_found = true
      else
        if editable_found
          @hide(@FORMS[i])
        else
          @accept(@FORMS[i])
    return @

    
    
    

    
  