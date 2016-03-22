require 'csv'

class CsvImporter
  
  IMPORT_PATH = Rails.root.join('config', 'imports')
  CSV_SETTINGS = {
    col_sep: ';',
    row_sep: "\n",
    headers: true,
    encoding: ''
  }
  
  EVS_FILENAME = 'ev_models.csv'
  EVS_PATH = IMPORT_PATH.join EVS_FILENAME
  
  FREE_ON_SELF_CONSUMPTION_FILENAME = 'free_on_self_consumption.csv'
  FREE_ON_SELF_CONSUMPTION_PATH = IMPORT_PATH.join FREE_ON_SELF_CONSUMPTION_FILENAME
  
  PV_PRODUCTION_FILENAME = 'pv_production.csv'
  PV_PRODUCTION_PATH = IMPORT_PATH.join PV_PRODUCTION_FILENAME
  
  RENEWABLE_ENERGY_BONUS_FILENAME = 'renewable_energy_bonus.csv'
  RENEWABLE_ENERGY_BONUS_PATH = IMPORT_PATH.join RENEWABLE_ENERGY_BONUS_FILENAME
  
  SELF_CONSUMPTION_BONUS_FILENAME = 'self_consumption_bonus.csv'
  SELF_CONSUMPTION_BONUS_PATH = IMPORT_PATH.join SELF_CONSUMPTION_BONUS_FILENAME
  
  BONUS_RANGE_MAP = {
    'kwp_1_10' =>  { min_value: 1,  max_value: 10 },
    'kwp_11_30' => { min_value: 11, max_value: 30 },
    'kwp_31_40' => { min_value: 31, max_value: 40 },
    'kwp_40_up' => { min_value: 41 }
  }
  
  def import_all
    import_evs
    import_free_on_self_consumption
    import_pv_production
    import_renewable_energy_bonus
    import_self_consumption_bonus
  end
  
  def import_evs
    puts "START Import evs - #{Ev.count} records currently in database."
    with_opened_file(EVS_PATH) do |f|
      f.each do |ev_data|
        ev_type = EvType.find_or_create_by(name: ev_data['type'])
        Ev.find_or_create_by({model: ev_data['model']}) do |ev|
          ev.assign_import_data(ev_data.to_hash.merge({'ev_type_id' => ev_type.id}))
        end
      end
    end
    puts "STOP Import evs - #{Ev.count} records currently in database."
  end
  
  def import_free_on_self_consumption
    puts "START Import free on self consumption - #{FreeOnSelfConsumption.count} records currently in database."
    with_opened_file(FREE_ON_SELF_CONSUMPTION_PATH) do |f|
      f.each do |fsc_data|
        FreeOnSelfConsumption.find_or_create_by(year: fsc_data['year']) do |fsc|
          fsc.assign_import_data(fsc_data)
        end
      end
    end
    puts "STOP Import free on self consumption - #{FreeOnSelfConsumption.count} records currently in database."
  end
  
  def import_pv_production
    puts "START Import pv production - #{PvProduction.count} records currently in database."
    with_opened_file(PV_PRODUCTION_PATH) do |f|
      f.each do |pvp_data|
        PvProduction.find_or_create_by(zip_code_start: pvp_data['zip_code_start'], zip_code_stop: pvp_data['zip_code_stop']) do |pvp|
          pvp.assign_import_data(pvp_data)
        end
      end
    end   
    puts "STOP Import pv production - #{PvProduction.count} records currently in database."
  end
  
  def import_renewable_energy_bonus
    import_bonus(RenewableEnergyBonus, RENEWABLE_ENERGY_BONUS_PATH)
  end
  
  def import_self_consumption_bonus
    import_bonus(SelfConsumptionBonus, SELF_CONSUMPTION_BONUS_PATH)
  end
  
  private
  
  def with_opened_file(file_path, &block)
    yield CSV.new(File.open(file_path), CSV_SETTINGS).read
  end
  
  def with_bonus_ranges(&block)
    res = {}.tap do |result|
      BONUS_RANGE_MAP.each do |(column, range_settings)|
        result[column] = BonusRange.find_or_create_by(range_settings)
      end
    end
    yield res
  end
  
  def import_bonus(bonus_subclass, file_path)
    puts "START Import #{bonus_subclass.name} - #{bonus_subclass.count} records currently in database."
    with_bonus_ranges do |bonus_ranges|
      with_opened_file(file_path) do |f|
        f.each do |bonus_data|
          bonus_ranges.each do |(col, range)|
            bonus_subclass.find_or_create_by(month: bonus_data['month'], year: bonus_data['year'], bonus_range: range) do |reb|
              reb.bonus_value = bonus_data[col] || 0
            end
          end
        end
      end
    end
    puts "STOP Import renewable energy bonus - #{bonus_subclass.count} records currently in database."
  end
  
end