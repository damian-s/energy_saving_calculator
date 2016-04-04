class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  
  before_action :set_locale, except: [:change_locale]
  
  def change_locale
    if params[:locale].present? && I18n.available_locales.include?(params[:locale].strip.to_sym)
      cookies.permanent[:energy_saving_calculator_locale] = params[:locale]
    end
    redirect_to root_path
  end
  
  private
  
  def set_locale
    if cookies[:energy_saving_calculator_locale] && I18n.available_locales.include?(cookies[:energy_saving_calculator_locale].to_sym)
      I18n.locale = cookies[:energy_saving_calculator_locale]
      I18n.default_locale = cookies[:energy_saving_calculator_locale]
    end
  end
  
end
