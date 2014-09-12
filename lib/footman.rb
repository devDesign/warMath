
class Footman < Unit
  attr_accessor :health_points,:attack_power,:name
  def initialize
    @name = "Footman"
    @health_points = 60
    @attack_power = 10
  end

  def attack!(enemy)
    if enemy.class.superclass == Building
      weak_attack = @attack_power / 2 
      enemy.damage(weak_attack)
    else
      enemy.damage(@attack_power)
    end
  end

end
