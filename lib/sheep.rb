
class Sheep < Unit
attr_accessor :name, :attack_power,:health_points
  def initialize
    @name = "Sheep"
    @attack_power = 1
    @health_points = 5
  end
end