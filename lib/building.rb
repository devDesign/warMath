class Building
  attr_accessor :health_points
  def initialize
    @health_points = 500
  end

  def damage(power)
    @health_points -= power
  end

end

  