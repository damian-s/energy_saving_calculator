@Result= React.createClass

  mixins: [ FormStatusHelpers ]
  
  propTypes:
    form_settings: React.PropTypes.object  
    
  shouldComponentUpdate: (new_props, new_state)->
    true
    
  form_name: 'result'
    
  render_form: ->
    `<div className='well form-content'>
      <ResultSummary form_settings={ this.state.summary } />
      <ResultDescription />
      <ResultLoadDistribution />
    </div>`
    
  render: ->
    `<div>
      { this.render_header_and_form_according_to_status(this.render_form) }
     </div>`