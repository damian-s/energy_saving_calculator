@ResultSummary = React.createClass

  propTypes:
    form_settings: React.PropTypes.object  
    
  shouldComponentUpdate: (new_props, new_state)->
    true
    
  t: (field_name)->
    I18n.t("result.summary.#{field_name}")
    
  render_row: (field_name)->
        `<tr>
          <td><strong>{ this.t(field_name) }</strong></td>
          <td>{ this.props.form_settings[field_name] } { I18n.t('kwh_year') }</td>
        </tr>`  
    
  render: ()->
    `<div className='row'>
      <div className='col-sm-3'></div>
      <div className='col-sm-6'>    
        <table className='table table-condensed'>
          <tbody>
            { this.render_row('electricity_production_pv') }
            { this.render_row('electricity_consumption_household') }
            { this.render_row('electricity_consumption_ev') }
          </tbody>
        </table>
      </div>
    </div>`    