class Farm < Building
  attr_accessor :name, :days_left, :built, :days_left, :target
  def initialize
    @target = $game.days + 10
    @built = false
    @name = "Farms"
  end

  def days_left
    @target - $game.days
  end

end