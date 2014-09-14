class Town < Building
  attr_reader :name
  attr_accessor :queue
  def initialize
    @name = "Town Hall"
    @queue = false
  end

  def can_train_peasant?
    $player.gold >= 100 && ($player.food - $player.demand >= 1)
  end

  def train_peasant
    if can_train_peasant?
      $player.gold -= 100
      puts "Peasant will be ready in 21 days"
      $player.training_peasants.push(Peasant.new)
    elsif $player.gold < 100
      puts "you need more gold"
    else 
      puts "you need more farms"
    end
  end
  
  
end