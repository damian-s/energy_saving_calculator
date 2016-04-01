@Result= React.createClass

  mixins: [ FormStatusHelpers ]
  
  propTypes:
    form_settings: React.PropTypes.object  
    
  shouldComponentUpdate: (new_props, new_state)->
    true
    
  form_name: 'result'
    
  load_distribution_fields: ['self_consumption_household', 'self_consumption_pv', 'necessary_electricity_ev', 'necessary_electricity_household', 'grid_feed']
  self_consumption_fields: ['relation']
  savings_fields: ['self_consumption_savings', 'loss_of_bonus', 'self_consumption_fee', 'total']
    
  render_form: ->
    `<div className='well form-content'>
      <ResultSummary form_settings={ this.state.summary } />
      <ResultDescription />
      <ResultTable form_settings={ this.state.load_distribution } table_name='load_distribution' fields={ this.load_distribution_fields } postfix={ I18n.t('kwh') } />
      <ResultTable form_settings={ this.state.self_consumption } table_name='self_consumption' fields={ this.self_consumption_fields } postfix='%' />
      <ResultTable form_settings={ this.state.savings } table_name='savings' fields={ this.savings_fields } postfix={ I18n.t('currency') } />
      <ResultChart chart_data={ this.state.cost_per_100 } chart_name='cost_per_100' />
    </div>`
    
  render: ->
    `<div>
      { this.render_header_and_form_according_to_status(this.render_form) }
     </div>`