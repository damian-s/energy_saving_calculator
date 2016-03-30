@SubmitButton = React.createClass
  
  propTypes:
    label: React.PropTypes.string
    form: React.PropTypes.string
    on_click: React.PropTypes.func
    
  on_click: ()->
    if @is_form_valid()
      @props.on_click()
      
  is_form_valid: ()->
    result = true
    $(@props.form).validator('destroy').validator('validate')
    _.each $("#{ @props.form } .form-group"), (field)->
      if $(field).hasClass('has-error')
        result = false
    return result
    
  render: ->
    `<button type='button' className='btn btn-default' onClick={ this.on_click }>
      <strong>{ this.props.label || I18n.t('submit') }</strong>
      <span className="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
    </button>`

