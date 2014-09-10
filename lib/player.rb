class Player
  attr_accessor :gold, :food, :lumber, :buildings, :units
  def initialize
    @gold= 100
    @lumber = 50
    @buildings = PlayerBuildings.new([Town.new,Barracks.new,[Farm.new,Farm.new,Farm.new]])
    @units = PlayerUnits.new([[Footman.new,Footman.new],[Peasant.new,Peasant.new,Peasant.new]])
    @food = 1
  end 

  def update_resources
    @food = (@buildings.food_supply_total(@buildings.player_buildings)) * 4
    @demand = @units.food_demand_total(@units.player_units)
    puts "Total gold: #{@gold}/10000 lumber: #{@lumber}/5000  food: #{@demand} /#{@food}"
    
  end
end
