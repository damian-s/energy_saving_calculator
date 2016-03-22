namespace :data_import do
  
  desc "Import evs data from config/imports/evs.csv"
  task evs: :environment do
    CsvImporter.new.import_evs
  end
  
  desc "Import free on self consumption data from config/imports/free_on_self_consumption.csv"
  task free_on_self_consumption: :environment do
    CsvImporter.new.import_free_on_self_consumption
  end
  
  desc "Import pv production data from config/imports/pv_production.csv"
  task pv_production: :environment do
    CsvImporter.new.import_pv_production
  end
  
  desc "Import renewable energy bonus data from config/imports/renewable_energy_bonus.csv"
  task renewable_energy_bonus: :environment do
    CsvImporter.new.import_renewable_energy_bonus
  end
  
  desc "Import self consumption bonus data from config/imports/self_consumption_bonus.csv"
  task self_consumption_bonus: :environment do
    CsvImporter.new.import_self_consumption_bonus
  end

  desc "Import all from config/imports directory"
  task all: :environment do
    CsvImporter.new.import_all
  end

end
