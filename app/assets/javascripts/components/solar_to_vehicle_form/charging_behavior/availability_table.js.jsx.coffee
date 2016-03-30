@AvailabilityTable = React.createClass

  propTypes:
    table_data: React.PropTypes.array
    on_delete: React.PropTypes.func
    
  table_data: ()->
    @props.table_data || []
    
  on_delete: (index)->
    ()=>
      @props.on_delete(index)

  delete_button: (index)->
    `<button type='button' className='btn btn-default' onClick={ this.on_delete(index) }>Delete</button>`
  
  render: ->
    `<table id='av_table' className='table table-striped'>
      <thead>
        <tr>
          <th> { I18n.t('availability_table.start') } </th>
          <th> { I18n.t('availability_table.stop') } </th>
          <th> { I18n.t('availability_table.day') } </th>
          <th> </th>
        </tr>
      </thead>
      <tbody>
        {this.table_data().map((row, index) => {
          return <tr key={index}><td>{ row.start }</td><td>{ row.stop }</td><td>{ row.type }</td><td>{ this.delete_button(index) }</td></tr>
        })}
      </tbody>
     </table>`
    
