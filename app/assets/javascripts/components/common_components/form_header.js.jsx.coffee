@FormHeader = React.createClass

  propTypes:
    form_name: React.PropTypes.string
    acceptance: React.PropTypes.bool

  form_title: ()->
    I18n.t("#{@props.form_name}.title")
    
  edit: ()->
    $('#stv_main_form').trigger 'edit_form', [@props.form_name]
    
  render_title: ()->
    `<h4><strong> { this.form_title() } </strong></h4>`
    
  render_title_with_acceptance: ()->
    `<div>
       <h4><strong> { this.form_title() } </strong></h4>
       <div>
         <p className="glyphicon glyphicon-big-link glyphicon-ok-circle" aria-hidden="true" onClick={ this.edit }></p>
         <p>{ I18n.t('click_to_edit') }</p>
       </div>
     </div>`
    
  render: ()->
    `<div className='well text-center form-header'>
      { this.props.acceptance ? this.render_title_with_acceptance() : this.render_title() } 
     </div>`