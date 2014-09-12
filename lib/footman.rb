class Footman < Unit
  attr_accessor :xp,:health_points,:attack_power,:name, :government_name, :kills, :age, :kids
  def initialize
    @name = "Footman"
    @kills = 0
    @kids = rand(0..5)
    @age = rand(13..35)
    @health_points = 60
    @attack_power = 10
    @greeting = $footman_greeting 
    @xp = rand(1..100)
    @government_name = $names.sample
  end

  def attack!(enemy)

    enemy.damage(@attack_power)
    
  end

end
