require_relative 'helper'
class Menu

  attr_reader :footman
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
    puts "1: View Current Party"
    puts "2: View Total Army"
    puts "3: Quick Create Party"
    puts "4: Send Party on Quest"
    puts "0: Back"
    @@user_selection = gets.chomp.to_i
    case @@user_selection
    when 1
      display_party
    when 2
      display_footmen_reserves
    when 3 
      quick_create
    when 4
      display_quest
    else
      display_units
    end
  end

  def quick_create
    $player.party.each do |footman|
      footman.in_party = false
    end
    $player.party = []
    random_arr = $player.footmen
    random_arr = random_arr.shuffle
    random_arr.each do |footman|
      if $player.party.size < 9
        $player.party.push(footman)
        footman.in_party = true
        puts "added #{footman.government_name} to party"
      end
    end
    $player.party.inspect
    gets
    display_footmen
  end


  def display_quest
    if $player.party.size > 0
      puts
      puts "Quest"
      puts "*****"
      puts "1: Send your #{$player.party.size} warriors to the Elwynn Forest."
      puts "2: Send your #{$player.party.size} warriors to the coast of Westfall."
      puts "3: Send your #{$player.party.size} warriors to the mountains of Dun Morogh."
      quest(gets.chomp.to_i)
    else
      puts "you havent created a party, try again."
    end
  end

  def quest(user_selection)
    case user_selection
    when 1 
      $quest.elwynn_forest
    when 2 
      $quest.westfall
    when 3 
      $quest.dun_morogh
    else
      display_footmen
    end
  end

  def display_party
    puts
    puts "Your Current Party"
    puts "******************"
    puts "You have #{$player.party.size} warriors in your party."
    $player.party.each_with_index do |footman, index |
      puts "#{index+1}: #{footman.government_name} HP:#{footman.health_points} XP:#{footman.xp}"
    end
    puts "select your warrior"
    display_footman(gets.chomp.to_i,false)
  end
    
  def display_footmen_reserves
    puts
    puts "Footmen Army"
    puts "************"
    puts "You have #{$player.footmen.size} warriors under your command:"
    $player.footmen.each_with_index do |footman,index|
      puts "#{index+1}: #{footman.government_name} HP:#{footman.health_points} XP:#{footman.xp}"
    end
    display_footman(gets.chomp.to_i,true)
  end

  def display_footman(index,party_or_reserves)
    display_footmen if index == 0
    footman = $player.footmen[index-1] if party_or_reserves
    footman = $player.party[index-1] unless party_or_reserves
    puts
    puts "#{footman.government_name}"
    puts "*********"
    puts "age: #{footman.age}"
    puts "kids: #{footman.kids}"
    puts "health: #{footman.health_points}"
    puts "kills: #{footman.kills}"
    puts "xp: #{footman.xp}"
    puts "#{footman.government_name} is in your party" if footman.in_party
    puts "add to party? y/n" if party_or_reserves && footman.in_party == false && $player.party.size < 9
    puts "remove from party y/n" unless party_or_reserves
    puts "your party is full." if $player.party.size > 9
    add_remove_party(gets.chomp, footman, party_or_reserves) 
  end

  def add_remove_party(yes_no, footman, party_or_reserves)
    if yes_no == "y" && party_or_reserves
      puts "added #{footman.government_name} to party." 
      footman.in_party = true
      $player.party.push(footman)
    elsif yes_no == "y" && party_or_reserves == false
      puts "removed #{footman.government_name} from party."
      footman.in_party = false
      $player.party.delete(footman)
    end
    puts "didnt add" if yes_no == "n"
    display_footmen
  end

end


