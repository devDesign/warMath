require_relative 'helper'
class Game
  
  def initialize
    @level = 0
    @turn = 0
    @selection = []
    welcome  
  end

  def welcome
    story = Story.new
    puts
    puts "WarMath III"
    puts story.start_story
  end
end


$game=Game.new
$player = Player.new
$menu = Menu.new
$menu.display_menu($menu.menu_layer_1)