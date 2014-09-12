class Player
  attr_accessor :gold, :food, :lumber, :buildings, :peasants, :demand, :footmen, :farms
  def initialize(peasants,footmen,buildings)
    @gold= 500
    @lumber = 50
    @farms = buildings
    @peasants = peasants
    @footmen = footmen
    @food = 1
  end 

  def food_demand_total
    food_demand = @peasants.size + @footmen.size * 2
  end

  def update_resources
    @food = (@farms.size) * 4
    @demand = food_demand_total
    puts "Total gold: #{@gold}/10000 lumber: #{@lumber}/5000  food: #{@demand} /#{@food}"
  end
end
