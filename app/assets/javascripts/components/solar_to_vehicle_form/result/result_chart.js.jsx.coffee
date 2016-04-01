@ResultChart = React.createClass

  propTypes:
    chart_data: React.PropTypes.array  
    chart_name: React.PropTypes.string
    
  componentDidMount: ()->
    new Chartkick.ColumnChart(@chart_id(), @props.chart_data)
    
  chart_title: ()->
    I18n.t("result.#{@props.chart_name}.title")
    
  chart_id: ()->
    "chart_#{@props.chart_name}"
    
  render: ()->
    `<div>
      <div className='row'>
        <div className='col-sm-12 text-left'>
          <h3> <i className='table-arrow glyphicon glyphicon-arrow-right'/> { this.chart_title() } </h3>
        </div>
      </div>
      <div className='row'>
        <div className='col-sm-3'></div>
        <div id={ this.chart_id() } className='col-sm-9 chartkick-container'></div>
      </div>
    </div>`