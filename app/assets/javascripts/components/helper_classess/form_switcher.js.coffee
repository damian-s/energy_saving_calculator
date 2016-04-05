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
    
  get_status: (form_name=@form_name)->
    @initial_state[form_name].status
  
  edit_next_if_not_accepted: ()->
    if @next_state_name && (@get_status(@next_state_name) != 'accepted')
      @edit(@next_state_name)
    return @

  show_result_if_all_accepted: ()->
    new_state = @get_new_state()
    show = true
    _.forEach @FORMS[0..(@FORMS.length - 2)], (form)->
      if new_state[form].status != 'accepted'
        show = false
    @edit('result') if show

# ==============================================================================

  get_new_state: ()->
    _.merge(@initial_state, @mask)
  
  edit_form: ()->
    @edit()
    @hide('result')
    
  submit_form: (form_data)->
    @set_new_state_data(form_data)
    @accept()
    @edit_next_if_not_accepted()
    @show_result_if_all_accepted()
    return @
    
# ==============================================================================