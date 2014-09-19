
class Unit
  attr_reader :health_points,:attack_power,:days_left
  
  attr_accessor :is_dead, :damage
    def initialize
    @health_points = health
    @attack_power = power

  end

  def attack(enemy)
    if enemy.is_dead? == true 
      puts "cant attack your dead guy"
    else
      enemy.damage(strike) 
    end
  
  end

  def damage(power)
    self.health_points -= power
    is_dead?
  end

  def is_dead?
    @health_points <=0
  end

  def days_left
    @target - $player.days
  end


end
