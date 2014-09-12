
require_relative 'helper'
class ChopMath
  def initialize
  
  end
  def random_generator
    return rand(1..$player.peasants.size)
  end

  def question
    puts "Peasants: '#{$player.peasants[0].confirm.sample}'"
    random_number_1 = random_generator
    random_number_2 = random_generator
    correct_answer = random_number_1 - random_number_2
    puts "#{random_number_1} - #{random_number_2} = "
    @answer = gets.chomp.to_i
    if @answer == correct_answer
      puts "+#{5*$player.peasants.size} lumber"
      $player.lumber += $player.peasants.size * 10
    else
      puts "WRONG"
    end
  
  end
end