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
      $game.announcer = "-100 GOLD"
      $player.training_peasants.push(Peasant.new)
    elsif $player.gold < 100
      $game.announcer = "you need more gold"
    else 
      $game.announcer = "you need more farms"
    end
  end
  
  
end