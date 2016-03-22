@SvHeader = React.createClass
  
  render: ->
    `<div className='col-md-12'>
      <div className='well text-center form-header'>
        <h4><strong> { I18n.t('sv_header.title') } </strong></h4>
        <h5 className='text-black'> { I18n.t('sv_header.subtitle') } </h5>
      </div>
      <div className='well form-content' dangerouslySetInnerHTML={ {__html: I18n.t('sv_header.explanation_html')} } >
      </div>
    </div>`
    
