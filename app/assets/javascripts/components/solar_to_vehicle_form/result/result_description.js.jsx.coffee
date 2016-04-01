@ResultDescription = React.createClass

  propTypes:
    form_settings: React.PropTypes.object  
    
  shouldComponentUpdate: (new_props, new_state)->
    true
    
  header_css_class: (colour)->
    "summary-description-header-#{colour} text-center col-sm-3"
 
  content_css_class: (colour)->
    "summary-description-content-#{colour}"
    
  column_title: (field_name)->
    I18n.t("result.description.#{field_name}_title")
    
  column_content: (field_name)->
    I18n.t("result.description.#{field_name}_content")
    
  render_description_content: (field_name, colour)->
    `<td className={ this.content_css_class(colour) }>
      { this.column_content(field_name) }
    </td>`

  render_description_header: (field_name, colour)->
    `<th className={ this.header_css_class(colour) }>
      { this.column_title(field_name) }
    </th>`
    
  render: ()->
    `<div className='row'>
      <div className='col-sm-12'>
        <table className='table'>
          <thead>
            <tr>
              <th className='col-sm-3'></th>
              { this.render_description_header('focus_on_time', 'red') }
              { this.render_description_header('focus_on_ev', 'yellow') }
              { this.render_description_header('optimal', 'green') }
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>{ I18n.t('result.description.text') }</td>
              { this.render_description_content('focus_on_time', 'red') }
              { this.render_description_content('focus_on_ev', 'yellow') }
              { this.render_description_content('optimal', 'green') }
            </tr>
          </tbody>
        </table>
      </div>
    </div>`