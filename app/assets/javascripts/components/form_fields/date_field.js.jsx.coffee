@DateField= React.createClass

  propTypes:
    value: React.PropTypes.string
    form_name: React.PropTypes.string # pv_system
    field_name: React.PropTypes.string # location
    is_required: React.PropTypes.bool #true
    type: React.PropTypes.string
    on_change: React.PropTypes.func
    
  picker_params: ()->
    switch @props.type
      when 'hour' then { format: 'HH:mm'  }
      else { defaultDate: @props.value, format: 'DD/MM/YYYY' }
    
  componentDidMount: ()->
    dp = $("##{@field_id()}").datetimepicker(@picker_params())
    dp.on 'dp.change', (e)=>
      @props.on_change(e)
    
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
        <input id={ this.field_id() } className='form-control' placeholder={ this.hint() } data-error={ this.error_message() } required={ this.props.is_required } />
        <span className="input-group-addon">
          <span className="glyphicon glyphicon-calendar"></span>
        </span>
      </div>
      <div className="help-block with-errors text-center"></div>
    </div>`
    
