@HourSliderField = React.createClass

  min_to_hour: (min)->
    moment().startOf('day').minutes(min).format('HH:mm')

  propTypes:
    form_name: React.PropTypes.string
    field_name: React.PropTypes.string
    on_change: React.PropTypes.func; 
    
  default_config: ()->
    formatter: (min)=>
      if min[0] && min[1]
        "#{ @min_to_hour(min[0]) }  #{ @min_to_hour(min[1]) }"
    min: 0
    max: 1439
    value: [480, 960]
    ticks_labels: ['00:00', '04:00', '08:00', '12:00', '16:00', '20:00', '24:00'],
    ticks: [0, 240, 480, 720, 960, 1200, 1439]
    step: 15
    
  componentDidMount: ()->
    $("##{@field_id()}").slider(@default_config())
    $("##{@field_id()}").on('slide', @convert_and_pass)

  convert_and_pass: (event)->
    @props.on_change event, _.map(event.value, @min_to_hour)
    
  label: ()->
    I18n.t("#{@props.form_name}.#{@props.field_name}_label")
  
  field_id: ()->
    "#{@props.form_name}_#{@props.field_name}"
    
  hint: ()->
    I18n.t("#{@props.form_name}.#{@props.field_name}_hint")
    
  values: ()->
    @props.values
    
  render: ->
    `<div className='form-group'>
      <div className='input-group strech-horizontal'>
        <input className='strech-horizontal' id={ this.field_id() } data-slider-id={ this.field_id() } type="text" />
      </div>
    </div>`
    
