@ResultLoadDistribution = React.createClass

  propTypes:
    form_settings: React.PropTypes.object  
    
  shouldComponentUpdate: (new_props, new_state)->
    true
    
  render: ()->
    `<div className='row'>
      <h3> Load distributo</h3>
      <div className='col-sm-12'>
      <table className='table'>
        <tbody>
          <tr>
            <td>qq</td>
            <td>ss</td>
            <td>ff</td>
          </tr>
        </tbody>
      </table>
      </div>
    </div>`