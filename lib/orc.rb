class Grunt < Unit 
  attr_accessor :name,:attack_power,:strike, :race,:health_points,:battle_cry
  def initialize
    @name = "Grunt"
    @race = "Orc"
    @health_points = 30
    @attack_power = 10
    @battle_cry = ["For the Horde!","Dabu!","Lok'tar!","Swobu!","Zug zug!","Time for killing!","Time to die!"]
    @strike = rand(1..@attack_power)
  end
end