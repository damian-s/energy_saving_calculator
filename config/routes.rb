Rails.application.routes.draw do
  root to: 'index#solar_to_vehicle_form'
  get '/change_locale/:locale' => 'application#change_locale', as: :change_locale
end
