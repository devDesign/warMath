class Footman < Unit
  attr_accessor :strike,:xp,:health_points,:attack_power,:name, :government_name, :kills, :age, :kids, :in_party, :target, :trained, :training
  def initialize
    @name = "Footman"
    @kills = 0
    @kids = [0,0,rand(0..5)].sample
    @age = rand(13..35)
    @health_points = 60
    @attack_power = 10
    @greeting = $footman_greeting 
    @xp = rand(1..100)
    @government_name = $names.sample
    @in_party = false
    @target = $game.days + 5
    @trained = false
    $game.barracks.queue == true ? @training = false : @training = true
  end

  def strike
    @attack_power + (@xp / 100)
  end

  def attack!(enemy)
    enemy.damage(@strike)
  end

end
