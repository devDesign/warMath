class PlayerUnits
  attr_accessor :player_units
  def initialize(player_units)
    @player_units = player_units
  end

  def display_arr
    units_arr = []
    @player_units.each do |n|
      if n.class == Array
        buildings_arr.push(n[0].name)
      else
        buildings_arr.push(n.name)
      end
    end
    return units_arr
  end

  def food_demand_total(player_units)
    unit_count_footmen = player_units[0].size
    unit_count_peasant = player_units[1].size
    return unit_count_peasant + unit_count_footmen * 2
  end
end


