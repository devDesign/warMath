require_relative 'helper'
class Game
  attr_accessor :level, :barracks, :town_hall, :announcer
  def initialize
    @level = 0
    @turn = 0
    @town_hall = Town.new
    @barracks = Barracks.new
    @announcer = "build your army"
  end
  
  def build_farm
    if $player.gold >= 500 && $player.lumber >= 250
      puts "Peasants: '#{$player.peasants[0].confirm.sample}'"
      @announcer = "-500 GOLD -250 LUMBER"
      $player.gold -= 500
      $player.lumber -=250
      @announcer += " farm will be ready in 10 days"
      $player.unbuilt_farms.push(Farm.new)
    else
      @announcer = "you need 500 gold and 250 lumber"
    end
  end

  def days_past_from_peasants
    @days += $player.peasants.size
  end

  def update_resources
    $player.build_queue
    @announcer = "you lost a loyal peasant in a math acident.. RIP #{$rip}" if $lost_peasant
    @announcer = "your #{$player.peasants.size} peasants mined +#{$player.peasants.size * 10} gold " if $grinding
    @announcer = "your #{$player.peasants.size} peasants harvested +#{5*$player.peasants.size} lumber" if $grinding_lumber
    $lost_peasant = false
    puts
    $player.food = ($player.farms.size) * 4
    $player.demand = $player.food_demand_total
    $game.level += 1
    puts @announcer
    @announcer = ""
    puts "Day:#{$player.days}"
    puts "gold: #{$player.gold} lumber: #{$player.lumber}  food: #{$player.demand} /#{$player.food} peasants: #{$player.peasants.length}  footmen: #{$player.footmen.length}"
  end

end
$announce = "build your army!"
$lost_peasant = false
$grinding_lumber =false
$grinding = false
$minemath = MineMath.new
$chopmath = ChopMath.new
$questmath = QuestMath.new
$game = Game.new
$player = Player.new([Peasant.new,Peasant.new,Peasant.new],[Footman.new,Footman.new],[Farm.new,Farm.new,Farm.new])

@menu = Menu.new
@menu.display_menu
