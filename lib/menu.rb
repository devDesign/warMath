require_relative 'helper'
class Menu
  @@user_selection = 0
  def initialize
    puts puts
    puts "WarMath III"
    puts "***********"
    puts "MISSION:"
    puts "Gather 10,000 gold, 5,000 lumber, train 20 footmen and kill all orcs"
    puts
    puts "The orcs are lurking in the forest"
    puts    
  end

  def display_menu
    puts "Main Menu"
    puts "*********"
    puts "1: Buildings - Train Units"
    puts "2: Units     - Control Units"
    @@user_selection = gets.chomp.to_i
    puts
    case @@user_selection
    when 1
      display_buildings
    when 2 
      display_units
    else
      display_menu
    end
  end

  def display_buildings
    puts "Buildings"
    puts "*********"
    puts "1: Town Hall"
    puts "2: Barracks"
    puts "0: BACK"
    @@user_selection = gets.chomp.to_i
    puts
    case @@user_selection
    when 1
      display_town_hall
    when 2
      display_barracks
    else
      display_menu
    end
  end 
  
  def display_town_hall
    puts
    puts "Town Hall"
    puts "*********"
    $player.update_resources
    puts "1: Train Peasants - 100 gold"
    puts "0: BACK"
    @@user_selection = gets.chomp.to_i
    puts
    case @@user_selection
    when 1
      $game.town_hall.train_peasant
    else
      display_menu
    end
    display_town_hall
  end
    
  def display_barracks
    puts
    puts "Barracks"
    puts "********"
    $player.update_resources
    puts "1: Train Footmen - 500 gold"
    puts "0: BACK"
    @@user_selection = gets.chomp.to_i
    puts
    case @@user_selection
    when 1
      $game.barracks.train_footman
    else
      display_menu
    end
    display_barracks
  end  

  def display_units
    puts
    puts "Units"
    puts "*****"
    puts "1: Peasants"
    puts "2: Footmen"
    puts "0: BACK"
    @@user_selection = gets.chomp.to_i
    puts
    case @@user_selection 
    when 1 
      display_peasants
    when 2 
      display_footmen
    else
      display_menu
    end
  end
  
  def display_peasants
    puts
    $player.update_resources
    puts
    puts "Peasants"
    puts "********"
    puts "1: Mine for gold"
    puts "2: Chop wood"
    puts "3: Build farms"
    puts "0: BACK"
    puts "You have #{$player.peasants.size} peasants under your command"
    puts "you lost a loyal peasant in a math acident.. RIP #{$names.sample}" if $lost_peasant
    puts "your #{$player.peasants.size} peasants mined +#{$player.peasants.size * 10} gold " if $grinding
    puts "your #{$player.peasants.size} peasants harvested +#{5*$player.peasants.size} lumber" if $grinding_lumber
    puts "Peasants: '#{$player.peasants[0].greeting.sample}'"
    $lost_peasant = false
    @@user_selection = gets.chomp.to_i
    puts
    case @@user_selection
    when 1 
      $grinding_lumber = false
      $minemath.question
    when 2
      $grinding = false
      $chopmath.question
    when 3
      $grinding_lumber = false
      $grinding = false
      $game.build_farm
    else
      $grinding = false
      $grinding_lumber = false
      display_units
    end
    display_peasants
  end
    
  def display_footmen
    puts
    puts "Footmen"
    puts "*******"
    puts "You have #{$player.footmen.size} warriors under your command:"
    $player.footmen.each_with_index do |footman,index|
      puts "#{index+1}: #{footman.government_name} HP:#{footman.health_points} XP:#{footman.xp}"
    end
    @@user_selection = gets.to_i
    case @@user_selection
    when 1 
      display_footman($player.footmen[0])
    else
      display_units
    end
    display_menu
  end

  def display_footman(footman)
    puts
    puts "#{footman.government_name}"
    puts "*********"
    puts "age: #{footman.age}"
    puts "kids: #{footman.kids}"
    puts "health: #{footman.health_points}"
    puts "kills: #{footman.kills}"
    puts "xp: #{footman.xp}"
    puts "add to army? y/n"
    gets
    display_footman
  end


end


