class Barracks < Building
  attr_accessor :name, :queue
  def initialize
    @queue = false
    @name = "Barracks"
  end
  def can_train_footman?
  $player.gold >= 500 && ($player.food - $player.demand >= 2)
  end
  
  def train_footman
    if can_train_footman?
    $player.gold -= 500
    $player.training_footmen.push(Footman.new)
    elsif $player.gold < 500
      puts "you need more gold"
    else 
      puts "you need more farms"
    end
  end

end
