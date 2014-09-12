require_relative 'helper'
class Game
  attr_accessor :level, :barracks, :town_hall
  def initialize
    @level = 0
    @turn = 0
    @town_hall = Town.new
    @barracks = Barracks.new
  end
  
  def build_farm
    if $player.gold >= 500 && $player.lumber >= 250
      puts "Peasants: '#{$player.peasants[0].confirm.sample}'"
      $player.farms.push(Farm.new)
      puts "-500 gold, -250 lumber"
      $player.gold -= 500
      $player.lumber -=250
    else
      puts "you need 500 gold and 250 lumber"
    end
  end
end
$lost_peasant = false
$grinding_lumber =false
$grinding = false
$minemath = MineMath.new
$chopmath = ChopMath.new
$game = Game.new
@menu = Menu.new
$player = Player.new([Peasant.new,Peasant.new,Peasant.new],[Footman.new,Footman.new],[Farm.new,Farm.new,Farm.new])
@menu.display_menu
