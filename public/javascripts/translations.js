I18n.translations || (I18n.translations = {});
I18n.translations["en"] = I18n.extend((I18n.translations["en"] || {}), {"availability":{"add":"Add availability","hour_start":"Start hour of availability","hour_start_hint":"Please enter start hour of car availability","hour_stop":"Stop hour of availability","hour_stop_hint":"Please enter stop hour of car availability","selected_type":{"weekday_opt":"Weekday","weekend_opt":"Weekend"},"selected_type_hint":"Please select day for new availability","selected_type_label":"Day of avaiability"},"availability_table":{"day":"Day of week","start":"Start of timeslot","stop":"Stop of timeslot"},"breadcrumbs":{"application":{"root":"Index"},"pages":{"pages":"Pages"}},"charging_behavior":{"average_capacity_at_start":"Average capacity at start of charging [%]","average_capacity_at_start_hint":"Enter average capacity at start of charging (in %)","average_daily_driving_distance":"Average dayly driving distance [km]","average_daily_driving_distance_hint":"Enter average dayly driving distance (in km)","enter_availability":"Please enter the time slots, when your car usually stands at home.","title":"Charging behavior"},"click_to_edit":"Click to edit","electric_vehicle":{"battery_capacity":"Battery capacity [kWh]","battery_capacity_hint":"Enter battery capacity (in kWh)","charging_power":"Charging power [kW]","charging_power_hint":"Enter charging power (in kW)","consumption":"Consumption [kWh/100km]","consumption_hint":"Enter power consumption (in kWh/100km)","entry_type":{"from_list_opt":"Select model from list","manual_opt":"Input data manually"},"entry_type_hint":"Please select your EV parameters","entry_type_label":"How do you want to enter your EV's data?","ev_label":"Car model","title":"Electric Vehicle"},"electricity_consumption":{"at_home_on_weekdays":{"false_opt":"No","true_opt":"Yes"},"at_home_on_weekdays_hint":"Please select if you are at home on working days","at_home_on_weekdays_label":"Are you daytimes usually at home on working days? (Monday - Friday 10:00 - 16:00)","electricity_price":"Your electricity price (household tarif) [ct/kWh]","electricity_price_hint":"Enter your current electricity price (in ct/kWh)","people_no":"Number of people in your household","people_no_hint":"Enter number of people in your household","title":"Electicity consumption","yearly_consumption":{"enter_people_no_opt":"Enter number of people in household","enter_value_opt":"Enter value"},"yearly_consumption_hint":"Please select how do you want to enter your yearly energy consumption","yearly_consumption_kwh":"Yearly consumption [kWh]","yearly_consumption_kwh_hint":"Enter yearly consumption (in kWh)","yearly_consumption_label":"Your yearly electricity consumption (household)"},"err":{"required_empty":"Please fill in this field","required_numeric":"Please enter a number"},"errors":{"connection_refused":"Oops! Failed to connect to the Web Console middleware.\nPlease make sure a rails development server is running.\n","unacceptable_request":"A supported version is expected in the Accept header.\n","unavailable_session":"Session %{id} is is no longer available in memory.\n\nIf you happen to run on a multi-process server (like Unicorn or Puma) the process\nthis request hit doesn't store %{id} in memory. Consider turning the number of\nprocesses/workers to one (1) or using a different server in development.\n"},"helpers":{"actions":"Actions","links":{"back":"Back","cancel":"Cancel","confirm":"Are you sure?","destroy":"Delete","edit":"Edit","new":"New"},"titles":{"delete":"Delete %{model}","edit":"Edit %{model}","new":"New %{model}","save":"Save %{model}"}},"hour_slider":{"selected_hour":"Selected hour"},"pv_system":{"date":"Commissioning date","date_hint":"Enter commisioning date","location_hint":"Enter your location's zip code","location_label":"Location (zip code)","power":"Power of the pv System","power_hint":"Enter power of the pv system in kWp","title":"PV system"},"result":{"title":"Result"},"submit":"Next","sv_header":{"explanation_html":"\u003cp\u003e\u003cstrong\u003eExplanation\u003c/strong\u003e\u003c/p\u003e \u003cp\u003eDiese Anwendung ermöglicht Ihnen eine schnelle Berechnung der Wirtschaftlichkeit und des erzielbaren Eigenvebrauchs in Abhängigkeit Ihrer Angaben zu PV-Anlage, Elektroauto, Ladestation und Nutzungsverhalten.\u003c/p\u003e \u003cul\u003e \u003cli\u003eAlle Eingabefelder sind mit Erklärungen versehen. In \"vorausgefüllten Pflichtfeldern\" sind bereits Erfahrungswerte eingetragen. Sie können diese übernehmen oder eigene Werte eintragen.\u003c/li\u003e \u003cli\u003eSie können - nach dem Ausfüllen aller Pflichtfelder und ggf. vorausgefüllter Pflichtfelder - die Berechnung starten, indem Sie auf den Button \"ERGEBNIS\" drücken. \u003c/li\u003e \u003cli\u003eSollten Sie nachträglich nochmal eine Eingabe verändern wollen drücken Sie bitte nochmals auf \"ERGEBNIS\" und nehmen Sie die gewünschten Änderungen vor. Anschließend kann die Berechnung erneut durch Klicken auf \"ERGEBNIS\" gestartet werden.\u003c/li\u003e \u003cli\u003eGenauere Informationen zu Ihrem Ergebnis erhalten Sie auch unter den Tabs \"Grafiken\" und \"Wirtschaftlichkeit\".\u003c/li\u003e \u003c/ul\u003e","mandatory_field":"Mandatory field","pre_filled_mandatory_field":"Pre-filled mandatory field","pre_optional_field":"Optional entry field","subtitle":"Your tool for optimizing self-consumption with your Electric Vehicle","title":"SOLAR TO VEHICLE"}});
I18n.translations["de"] = I18n.extend((I18n.translations["de"] || {}), {"aaa":"bbb de","breadcrumbs":{"application":{"root":"Index"},"pages":{"pages":"Pages"}},"helpers":{"actions":"Actions","links":{"back":"Back","cancel":"Cancel","confirm":"Are you sure?","destroy":"Delete","edit":"Edit","new":"New"},"titles":{"delete":"Delete %{model}","edit":"Edit %{model}","new":"New %{model}","save":"Save %{model}"}}});
