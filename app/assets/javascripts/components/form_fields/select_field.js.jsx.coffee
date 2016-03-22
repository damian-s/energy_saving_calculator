@SelectField= React.createClass

  propTypes:
    values: React.PropTypes.array
    selected_value: React.PropTypes.string
    form_name: React.PropTypes.string # pv_system
    field_name: React.PropTypes.string # location
    is_required: React.PropTypes.bool #true
    on_change: React.PropTypes.func; 
    
  componentDidMount: ()->
    s = $("##{@field_id()}").select2({
      theme: "bootstrap"
      placeholder: @hint()
      allowClear: false
    }).val(@props.selected_value).trigger('change')
    s.on "change", (e)=>
      @props.on_change(e)

  label: ()->
    I18n.t("#{@props.form_name}.#{@props.field_name}_label")
  
  field_id: ()->
    "#{@props.form_name}_#{@props.field_name}"
    
  hint: ()->
    I18n.t("#{@props.form_name}.#{@props.field_name}_hint")
    
  values: ()->
    @props.values || ['']
    
  error_message: ()->
    I18n.t('err.required_empty')
    
  option_text: (option)->
    return '' if option == ''
    I18n.t("#{@props.form_name}.#{@props.field_name}.#{option}_opt")
    
  render: ->
    `<div className='form-group'>
      <div className='input-group strech-horizontal'>
        <span className='input-group-addon fixed-width'>{ this.label() }</span>
        <select id={ this.field_id() } className='form-control' data-error={ this.error_message() } required={ this.props.is_required } >
          {this.values().map((opt) => {
            return <option key={opt} value={opt}>{ this.option_text(opt) }</option>
          })}
        </select>
      </div>
      <div className="help-block with-errors text-center"></div>
    </div>`
    
