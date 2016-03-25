@Result= React.createClass

  mixins: [ FormStatusHelpers ]
  
  propTypes:
    form_settings: React.PropTypes.object  
    
  form_name: 'result'
    
  render_form: ->
    `<div className='well form-content'>
      Result { this.props.form_settings.test }
    </div>`
    
  render: ->
    `<div className='col-md-12'>
      { this.render_header_and_form_according_to_status(this.render_form) }
     </div>`