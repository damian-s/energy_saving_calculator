@SvHeader = React.createClass
  
  render: ->
    `<div className='col-md-12'>
      <div className='well text-center'>
        <h4><strong> { I18n.t('sv_header.title') } </strong></h4>
        <h5> { I18n.t('sv_header.subtitle') } </h5>
      </div>
      <div className='well' dangerouslySetInnerHTML={ {__html: I18n.t('sv_header.explanation_html')} } >
      </div>
    </div>`
    
