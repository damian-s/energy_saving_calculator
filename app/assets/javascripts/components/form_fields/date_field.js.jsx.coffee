@DateField= React.createClass

  propTypes:
    value: React.PropTypes.string
    form_name: React.PropTypes.string
    field_name: React.PropTypes.string
    is_required: React.PropTypes.bool
    type: React.PropTypes.string
    on_change: React.PropTypes.func
    
  picker_params: ()->
    switch @props.type
      when 'hour' then { format: 'HH:mm'  }
      else { 
        defaultDate: @props.value, 
        format: @date_format() 
        parseInputDate: (d)=>
          moment(d, @date_format() )
      }
      
  date_format: ()->
    I18n.t('date_format')
    
  componentDidMount: ()->
    @dp = $("##{@field_id()}").datetimepicker(@picker_params())
    @dp.on 'dp.change', (e)=>
      @props.on_change(e)
    
  label: ()->
    I18n.t("#{@props.form_name}.#{@props.field_name}")
  
  field_id: ()->
    "#{@props.form_name}_#{@props.field_name}"
    
  hint: ()->
    I18n.t("#{@props.form_name}.#{@props.field_name}_hint")
    
  error_message: ()->
    if @props.is_required
      I18n.t('err.required_empty')
    else
      false
      
  toggle_dp: ()->
    @dp.data("DateTimePicker").show()
    
  render: ->
    `<div className='form-group'>
      <div className='input-group strech-horizontal'>
        <span className='input-group-addon fixed-width'> { this.label() } </span>
        <input id={ this.field_id() } className='form-control' placeholder={ this.hint() } data-error={ this.error_message() } required={ this.props.is_required } />
        <span className="input-group-addon with-link-cursor" onClick={ this.toggle_dp }>
          <span className="glyphicon glyphicon-calendar" ></span>
        </span>
      </div>
      <div className="help-block with-errors text-center"></div>
    </div>`
    
