@AvailabilityTable = React.createClass

  propTypes:
    table_data: React.PropTypes.array
    
  table_data: ()->
    @props.table_data || []
#    (@props.table_data || []).map (row, index)->
#      _.merge row, {key: index}
#    
  render: ->
    `<table>
      <thead>
        <tr>
          <th> { I18n.t('start') } </th>
          <th> { I18n.t('stop') } </th>
          <th> { I18n.t('day') } </th>
        </tr>
      </thead>
      <tbody>
        {this.table_data().map((row, index) => {
          return <tr key={index}><td>{ row.start }</td><td>{ row.stop }</td><td>{ row.type }</td></tr>
        })}
      </tbody>
     </table>`
    
