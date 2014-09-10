class Menu
  attr_reader :menu_layer_1
  def initialize
    @menu_layer_1 = ["Buildings","Units"]
    #@menu_units = [$player.units.worker,$player.units.warriors]

  end

  def display_menu(array)
    
    $player.update_resources
    current_options = array.each_with_index { |options,index| puts "#{index+1}: #{options}" }
    user_selection_layer_1(gets.chomp.to_i)
  end

  def user_selection_layer_1(user_selection)
    case user_selection
    when 1
      display_menu($player.buildings.display_arr)
    when 2 
      display_menu(@menu_units)
    end
  end
end


