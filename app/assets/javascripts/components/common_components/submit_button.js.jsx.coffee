@SubmitButton = React.createClass
  
  propTypes:
    label: React.PropTypes.string
    on_click: React.PropTypes.func
    
  render: ->
    `<button type='button' className='btn btn-default' onClick={ this.props.on_click }>
      <strong>{ this.props.label || I18n.t('submit') }</strong>
      <span className="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
    </button>`

