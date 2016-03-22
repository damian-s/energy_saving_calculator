@Result= React.createClass

  propTypes:
    form_settings: React.PropTypes.object  
    
  render: ->
    `<div className='col-md-12'>
      <div className='well text-center'>
        <h4> { I18n.t('result.title') } </h4>
      </div>
      <div className='well'>
        Result { this.props.form_settings.test }
      </div>
    </div>`
    
