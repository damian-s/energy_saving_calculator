@AvailabilityTable = React.createClass

  propTypes:
    table_data: React.PropTypes.array
    header: React.PropTypes.string
    on_delete: React.PropTypes.func
    
  table_data: ()->
    @props.table_data || []
    
  on_delete: (index)->
    ()=>
      @props.on_delete(index)

  delete_button: (ts)->
    `<button type='button' className='btn btn-default' onClick={ this.on_delete(ts) }>Delete</button>`
  
  render: ->
    `<div>
      <h3>{ this.props.header }</h3>
      <table id='av_table' className='table table-striped'>
        <thead>
          <tr>
            <th> { I18n.t('availability_table.start') } </th>
            <th> { I18n.t('availability_table.stop') } </th>
            <th> </th>
          </tr>
        </thead>
        <tbody>
          {this.table_data().map((row, index) => {
            return <tr key={index}><td>{ row.start }</td><td>{ row.stop }</td><td>{ this.delete_button(row) }</td></tr>
          })}
        </tbody>
       </table>
      </div>`
    
