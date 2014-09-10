class Barracks < Building
  attr_reader :name
  def initialize
    @name = "Barracks"
  end
  def can_train_footman?
    $player.gold >= 400 && $player.food >= 2  
  end
  
  def train_footman
    if can_train_footman?
    $player.gold -= 60
    $player.food -= 2
    Footman.new
    end
  end

  def can_train_peasant?
    $player.gold >= 400 && $player.food >= 2
  end

  def train_peasant
    if can_train_footman?
      $player.gold -= 400
      $player.food -= 1
      Peasant.new
    end
  end
end
