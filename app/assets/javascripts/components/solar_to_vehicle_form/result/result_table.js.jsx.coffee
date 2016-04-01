@ResultTable = React.createClass

  propTypes:
    form_settings: React.PropTypes.object  
    table_name: React.PropTypes.string
    fields: React.PropTypes.array
    postfix: React.PropTypes.string
    
  shouldComponentUpdate: (new_props, new_state)->
    true
    
  table_title: ()->
    I18n.t("result.#{@props.table_name}.title")
    
  row_title: (field_name)->
    I18n.t("result.#{@props.table_name}.#{field_name}.title")
    
  row_class: (field_name)->
    "equal-cells-width-4 #{@props.form_settings[field_name].style}"
    
  cell_value: (value)->
    "#{value} #{@props.postfix}"
    
  render_row: (field_name)->
    `<tr key={ field_name } className={ this.row_class(field_name) }>
      <td className='row-header'>{ this.row_title(field_name) }</td>
      { this.props.form_settings[field_name].data.map((val, index) => {
          return <td key={ index }>{ this.cell_value(val) }</td>
      })}
    </tr>`
    
    
  render: ()->
    `<div>
      <div className='row'>
        <div className='col-sm-12 text-left'>
          <h3> <i className='table-arrow glyphicon glyphicon-arrow-right'/> { this.table_title() } </h3>
        </div>
      </div>
      <div className='row'>
        <div className='col-sm-12'>
          <table className='table'>
            <tbody>
              { this.props.fields.map((field) => {
                return this.render_row(field)
              })}
            </tbody>
          </table>
        </div>
      </div>
    </div>`