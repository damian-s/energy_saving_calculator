@ElectricityConsumption = React.createClass
  
  propTypes:
    form_settings: React.PropTypes.object
  
  render: ->
    `<div className='col-md-12'>
      <div className='well text-center'>
        <h4> { I18n.t('electricity_consumption.title') } </h4>
      </div>
      <div className='well'>
        Electricity consumption { this.props.form_settings.test }
      </div>
    </div>`
    
