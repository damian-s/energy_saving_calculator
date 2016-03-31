@ResultSelfConsumption = React.createClass

  propTypes:
    form_settings: React.PropTypes.object  
    
  shouldComponentUpdate: (new_props, new_state)->
    true
    
  render: ()->
    ''