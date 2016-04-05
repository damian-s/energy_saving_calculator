@ErrorMessage = React.createClass

  propTypes:
    message: React.PropTypes.string
    on_show: React.PropTypes.func
    
  render: ()->
    @props.on_show() if @props.on_show?
    `<div className='well error-well'>
      { this.props.message }
    </div>`