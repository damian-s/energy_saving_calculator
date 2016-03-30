require 'rails_helper'

FORMS = ['pv_system_form', 'electric_vehicle_form', 'charging_behavior_form', 'electricity_consumption_form']

def fill_form(form_name, &block)
  return if !FORMS.include? form_name
  FORMS.each do |form|
    send "fill_#{form}"
    return yield(form_name) if form == form_name
  end
end

def fill_pv_system_form
  within('form#pv_system_form') do
    select('01000 - 01999', from: 'pv_system_location')
    fill_in 'pv_system_power', with: '300'
    fill_in 'pv_system_date', with: '2015-01-01'
    click_button 'Next'
  end
end

def fill_electric_vehicle_form
  within('form#electric_vehicle_form') do
    select('manual', from: 'electric_vehicle_entry_type')
    fill_in 'electric_vehicle_battery_capacity', with: '100'
    fill_in 'electric_vehicle_charging_power', with: '200'
    fill_in 'electric_vehicle_consumption', with: '300'
    click_button 'Next'
  end
end

def fill_charging_behavior_form
  within('form#charging_behavior_form') do
    fill_in 'charging_behavior_average_capacity_at_start', with: '50'
    fill_in 'charging_behavior_average_daily_driving_distance', with: '100'
    add_availability('Weekday', 0, 1)
    add_availability('Weekend', 2, 4)
    click_button 'Next'
  end
end

def fill_electricity_consumption_form
  within('form#electricity_consumption_form') do
    select 'No', from: 'electricity_consumption_at_home_on_weekdays'
    select 'Enter number of people in household', from: 'electricity_consumption_yearly_consumption'
    fill_in 'electricity_consumption_people_no', with: 3
    fill_in 'electricity_consumption_electricity_price', with: 123
    click_button 'Next'
  end
  
end

def add_availability(type, start_tick_index, stop_tick_index)
  select(type, from: 'availability_selected_type')
  sliders[0].drag_to ticks[start_tick_index]
  sliders[1].drag_to ticks[stop_tick_index]
  click_button 'Add availability'
end

def ticks
  all(:css, 'div.slider-tick')
end

def sliders
  all(:css, 'div.slider-handle')
end

def is_form_accepted?(form_name)
  puts "accepted? #{form_name}"
  with_header(form_name) do |header|
    expect(header).to have_content(I18n.t("#{raw_id(form_name)}.title"))
    expect(header).to have_content(I18n.t('click_to_edit'))
    expect(header).to have_css('p.glyphicon.glyphicon-big-link.glyphicon-ok-circle')
    expect(page).to have_no_css("form##{form_name}")
  end
end

def is_form_editable?(form_name)
  puts "editable? #{form_name}"
  with_header(form_name) do |header|
    expect(header).to have_content(I18n.t("#{raw_id(form_name)}.title"))
    expect(header).to have_no_content(I18n.t('click_to_edit'))
    expect(header).to have_no_css('p.glyphicon.glyphicon-big-link.glyphicon-ok-circle')
    expect(page).to have_css("form##{form_name}")
  end  
end

def is_form_hidden?(form_name)
  puts "hidden? #{form_name}"
  expect(page).to have_no_css("form##{form_name}")
  expect(page).to have_no_css("div##{header_id(form_name)}")
end

def are_previous_forms_accepted?(form_name)
  return if ((form_index = FORMS.index(form_name)) == 0 )
  FORMS[0..(form_index - 1)].each{|pform| is_form_accepted?(pform) }
end

def are_next_forms_hidden?(form_name)
  return if ((form_index = FORMS.index(form_name)) > (FORMS.size - 3))
  FORMS[(form_index + 2)..(FORMS.size - 1)].each{|nform| is_form_hidden?(nform) }
  #return if (form_name == FORMS.last)
  #form_index = FORMS.index(form_name)
  #FORMS[(form_index + 1)..(FORMS.size - 1)].each{|nform| is_form_hidden?(nform) }
end

def is_next_form_editable?(form_name)
  return if (form_name == FORMS.last)
  form_index = FORMS.index(form_name)
  is_form_editable?(FORMS[form_index + 1])
end

def header_id(form_name)
  form_name.gsub('_form', '_header')
end

def raw_id(form_name)
  form_name.gsub('_form', '')
end

def with_header(form_name, &block)
  yield find("div##{header_id(form_name)}")
end

describe 'main form data flow', js: true do

  it 'fills forms and changes status editable/accepted/hidden' do
    FORMS.each do |f|
      visit '/'
      fill_form f do |form_name|
        is_form_accepted?(form_name)
        is_next_form_editable?(form_name)
        are_previous_forms_accepted?(form_name)
        are_next_forms_hidden?(form_name)
      end
    end
  end
  
end