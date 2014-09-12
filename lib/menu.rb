
require_relative 'helper'
class Menu
  @@user_selection = 0
  def initialize
    puts puts
    puts "WarMath III"
    puts "***********"
    puts "MISSION:"
    puts "Gather 1000 gold, 1000 lumber, train 10 footmen and kill all orcs"
    puts
    puts "The orcs are lurking in the forest"
    puts    
  end

  def display_menu

    puts "1: Buildings - Train Units"
    puts "2: Units     - Control Units"
    @@user_selection = gets.chomp.to_i
    display_buildings_and_units
  end

  def display_menu_buildings
    case @@user_selection
    when 1
      puts "Town Hall"
      puts "*********"
      $player.update_resources
      puts "1: Train Peasants - 100 gold"
      puts "0: BACK"
      @@user_selection = gets.chomp.to_i
      if @@user_selection == 1
        $game.town_hall.train_peasant
      else
        display_menu
      end
      display_menu_buildings()
    when 2 
      puts "Barracks"
      puts "********"
      $player.update_resources
      puts "1: Train Footmen - 500 gold"
      puts "0: BACK"
      @@user_selection = gets.chomp.to_i
      if @@user_selection == 1
        $player.barracks.train_footman
      else
        display_menu
      end
      display_menu if @@user_selection == 0
    end  
  end

  def display_buildings_and_units
    case @@user_selection
    when 1
      puts "Buildings"
      puts "*********"
      puts "1: Town Hall"
      puts "2: Barracks"
      puts "0: BACK"
      @@user_selection = gets.chomp.to_i
      display_menu if @@user_selection == 0
      display_menu_buildings
    when 2 
      puts "Units"
      puts "*****"
      puts "1: Peasants"
      puts "2: Footmen"
      puts "0: BACK"
      @@user_selection = gets.chomp.to_i
      display_menu if @@user_selection == 0
      user_selection_units
    else
      display_menu
    end
  end

  def user_selection_units
    case @@user_selection
    when 1
      puts "Peasants"
      puts "********"
      puts "You have #{$player.peasants.size} peasants under your command"
      $player.update_resources
      puts "1: Mine for gold"
      puts "2: Chop wood"
      puts "3: Build farms"
      puts "0: BACK"
      puts "Peasants: '#{$player.peasants[0].greeting.sample}'"
      @@user_selection = gets.chomp.to_i
      if @@user_selection == 1
        $minemath.question
      elsif @@user_selection == 2
        $chopmath.question
      elsif @@user_selection == 3
        $game.build_farm
      end
      display_menu if @@user_selection == 0
      @@user_selection =1
      user_selection_units()
      
    when 2 
      warriors
      display_menu if @@user_selection == 0
    else
      display_menu
    end
  end

  def warriors
    puts "Footmen"
    puts "*******"
    puts "You have #{$player.footmen.size} warriors under your command:"
  end

end


