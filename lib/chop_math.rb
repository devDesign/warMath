class ChopMath
  def initialize
  @@death = -1
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
      $grinding_lumber = true
      $player.lumber += $player.peasants.size * 10
    else
      $grinding_lumber = false
      unless $player.peasants.size == 1
        $player.peasants.delete_at($player.peasants.length-1) 
        $lost_peasant = true
      end
    end
  $game.days += 1
  end
end