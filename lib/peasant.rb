
class Peasant < Unit
  attr_accessor :xp,:name, :greeting,:confirm, :target,:government_name,:trained,:training
  def initialize
    @target = 0
    @trained = false
    @name = "Peasant"
    @greeting = $peasant_greeting
    @confirm = $peasant_confirm
    @government_name = $names.sample
    @health_points = 35
    @xp = rand(0..15)
    $game.town_hall.queue == true ? @training = false : @training = true
  end

end
