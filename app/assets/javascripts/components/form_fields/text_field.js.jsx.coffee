@TextField= React.createClass

  propTypes:
    value: React.PropTypes.string
    form_name: React.PropTypes.string
    field_name: React.PropTypes.string
    type: React.PropTypes.string
    is_required: React.PropTypes.bool
    on_change: React.PropTypes.func
    
  label: ()->
    I18n.t("#{@props.form_name}.#{@props.field_name}")
  
  field_id: ()->
    "#{@props.form_name}_#{@props.field_name}"
    
  hint: ()->
    I18n.t("#{@props.form_name}.#{@props.field_name}_hint")
    
  error_message: ()->
    if @props.required
      switch @props.type
        when 'text' then I18n.t('err.required_empty')
        when 'numeric' then I18n.t('err.required_numeric')
        else ''
    else
      ''
    
  render: ->
    `<div className='form-group'>
      <div className='input-group strech-horizontal'>
        <span className='input-group-addon fixed-width'> { this.label() } </span>
        <input id={ this.field_id() } className='form-control' type={ this.props.type } defaultValue={ this.props.value } onChange={ this.props.on_change } placeholder={ this.hint() } data-error={ this.error_message() } required={ this.props.is_required } />
      </div>
      <div className="help-block with-errors text-center"></div>
    </div>`
    
