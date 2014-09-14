require_relative 'helper'
class Game
  attr_accessor :level, :barracks, :town_hall, :days
  def initialize
    @level = 0
    @turn = 0
    @days = 0
    @town_hall = Town.new
    @barracks = Barracks.new
  end
  
  def build_farm
    if $player.gold >= 500 && $player.lumber >= 250
      puts "Peasants: '#{$player.peasants[0].confirm.sample}'"
      puts "-500 gold, -250 lumber"
      $player.gold -= 500
      $player.lumber -=250
      puts "your farm will be ready in 10 days"
      $player.unbuilt_farms.push(Farm.new)
    else
      puts "you need 500 gold and 250 lumber"
    end
  end

  def days_past_from_peasants
    @days += $player.peasants.size
  end 

  def update_resources
    $player.build_queue
    puts
    $player.food = ($player.farms.size) * 4
    $player.demand = $player.food_demand_total
    $game.level += 1
    puts "Day:#{$game.days}"
    puts "gold: #{$player.gold} lumber: #{$player.lumber}  food: #{$player.demand} /#{$player.food} peasants: #{$player.peasants.length}  footmen: #{$player.footmen.length}"
  end

end
$lost_peasant = false
$grinding_lumber =false
$grinding = false
$minemath = MineMath.new
$chopmath = ChopMath.new
$game = Game.new
$player = Player.new([Peasant.new,Peasant.new,Peasant.new],[Footman.new,Footman.new],[Farm.new,Farm.new,Farm.new])

@menu = Menu.new
@menu.display_menu
