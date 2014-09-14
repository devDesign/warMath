class Player
  attr_accessor :gold, :food, :lumber, :buildings, :peasants, :training_footmen, :demand, :footmen, :farms, :party, :unbuilt_farms, :training_peasants
  def initialize(peasants,footmen,farms)
    @gold= 5000
    @lumber = 2500
    @unbuilt_farms = []
    @farms = farms
    @peasants = peasants
    @training_peasants = []
    @footmen = footmen
    @training_footmen = []
    @food = 1
    @party = []
  end 

  def food_demand_total
    food_demand = @peasants.size + @footmen.size * 2
  end

  def build_queue
    @unbuilt_farms.each do |farm|
      if farm.built == false && farm.target <= $game.days
        farm.built = true
        puts "Peasant : 'Jobs done.'"
        @farms.push(farm)
        $player.build_queue
      elsif farm.built == false
        puts "building #{farm.name}.... days left: #{farm.days_left}"
      end
    end
    @training_peasants.each do |peasant|
      if peasant.target <= $game.days && peasant.training == true && peasant.trained == false
        puts "New peasant: " + peasant.greeting.sample
        peasant.trained = true
        $game.town_hall.queue = false
        @peasants.push(peasant)
        build_queue
      elsif peasant.trained == false && peasant.training == true
        $game.town_hall.queue = true
        puts "training peasant #{peasant.government_name}.... days left: #{peasant.days_left}"
      elsif $game.town_hall.queue == false && peasant.trained == false
        $game.town_hall.queue = true
        peasant.target = $game.days + 5
        peasant.training = true
      end
    end
    @training_footmen.each do |footman|
      if footman.target <= $game.days && footman.training == true && footman.trained == false
        puts "new footman : 'Ready for action.'"
        footman.trained = true
        $game.barracks.queue = false
        @footmen.push(footman)
        build_queue
      elsif footman.trained == false && footman.training == true
        $game.barracks.queue = true
        puts "training footman #{footman.government_name}.... days left: #{footman.days_left}"
      elsif $game.barracks.queue == false && footman.trained == false
        $game.barracks.queue = true
        footman.target = $game.days + 5
        footman.training = true
      end
    end

  end

  def add_remove_party(user_input)
    @menu.display_footmen if user_input == "n"
    if @menu.party == true
      @party.push(@menu.footman)
    end
  end

end
