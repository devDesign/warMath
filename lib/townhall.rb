class Town < Building
  attr_reader :name
  def initialize
    @name = "Town Hall"
  end

  def can_train_peasant?
    $player.gold >= 100 && ($player.food - $player.demand >= 1)
  end

  def train_peasant
    if can_train_peasant?
    $player.gold -= 100
    puts "Peasant: #{$player.peasants[0].greeting[0]}"
    $player.peasants.push(Peasant.new)
    elsif $player.gold < 100
      puts "you need more gold"
    else 
      puts "you need more farms"
    end
  end
  
  
end