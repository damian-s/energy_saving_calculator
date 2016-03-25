@TextFieldReadonly = React.createClass

  propTypes:
    value: React.PropTypes.string
    form_name: React.PropTypes.string
    field_name: React.PropTypes.string
    field_type: React.PropTypes.string
    
  label: ()->
    I18n.t("#{@props.form_name}.#{@props.field_name}")
  
  field_id: ()->
    "#{@props.form_name}_#{@props.field_name}"
    
  render: ->
    `<div className='form-group'>
      <div className='input-group strech-horizontal'>
        <span className='input-group-addon fixed-width'> { this.label() } </span>
        <input id={ this.field_id() } className='form-control' type={ this.props.field_type } value={ this.props.value } readOnly='true' />
      </div>
    </div>`
    
