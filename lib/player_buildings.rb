class PlayerBuildings
  attr_accessor :player_buildings
  def initialize(player_buildings)
    @player_buildings = player_buildings
  end

  def display_arr
    buildings_arr = []
    @player_buildings.each do |n|
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


