
class Peasant < Unit
  attr_accessor :name, :greeting,:confirm
  def initialize
    @name = "Peasant"
    @greeting = $peasant_greeting
    @confirm = $peasant_confirm
    @health_points = 35
  end

end
