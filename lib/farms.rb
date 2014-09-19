class Farm < Building
  attr_accessor :name, :days_left, :built, :days_left, :target
  def initialize
    @target = 0
    @built = false
    @name = "Farms"
  end

  def days_left
    @target - $player.days
  end

end