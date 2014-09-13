class Player
  attr_accessor :gold, :food, :lumber, :buildings, :peasants, :demand, :footmen, :farms, :party
  def initialize(peasants,footmen,farms)
    @gold= 100000
    @lumber = 100000
    @farms = farms
    @peasants = peasants
    @footmen = footmen
    @food = 1
    @party = []
  end 

  def food_demand_total
    food_demand = @peasants.size + @footmen.size * 2
  end

  def update_resources
    @food = (@farms.size) * 4
    @demand = food_demand_total
    puts "Total gold: #{@gold} lumber: #{@lumber}  food: #{@demand} /#{@food}  peasants: #{@peasants.length}  footmen: #{@footmen.length}"
  end

  def add_remove_party(user_input)
    @menu.display_footmen if user_input == "n"
    if @menu.party == true
      @party.push(@menu.footman)
    end
  end

end
