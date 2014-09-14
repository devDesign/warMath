
class Unit
  attr_reader :health_points,:attack_power,:days_left
  def initialize(health,power)
    @health_points = health
    @attack_power = power

  end

  def attack!(enemy)
    if enemy.is_dead? == true || self.is_dead? == true
      puts "cant attack your dead guy"
    else
      enemy.damage(@attack_power) 
    end
  
  end

  def damage(power)
    @health_points -= power
    is_dead?
  end

  def is_dead?
    @health_points <=0
  end

  def days_left
    @target - $game.days
  end


end
