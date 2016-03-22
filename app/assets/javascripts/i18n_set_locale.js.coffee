$.fn.set_locale = ->
  I18n.locale = $('html').attr('lang')
  I18n.defaultLocale = $('html').attr('lang')
  
$( document ).ready ()->
  $.fn.set_locale()