class PlayerBuildings
  attr_accessor :buildings_display
  def initialize(player_buildings)
    @buildings_display = player_buildings
  end

  def display_arr(all_buildings)
    buildings_arr = []
    all_buildings.each do |n|
      if n.class == Array
        buildings_arr.push(n[0].name)
      else
        buildings_arr.push(n.name)
      end
    end
    return buildings_arr
  end

  def food_supply_total(player_buildings)
    farm_count = player_buildings[2].size
    return farm_count
  end

end


