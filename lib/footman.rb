class Footman < Unit
  attr_accessor :battle_cry,:strike,:xp,:health_points,:attack_power,:name, :government_name, :kills, :age, :kids, :in_party, :target, :trained, :training
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
    @target = 0
    @trained = false
    $game.barracks.queue == true ? @training = false : @training = true
    @battle_cry = $footman_confirm.sample
  end

  def strike
    @xp / rand(20..50)
  end

  def attack(enemy)
    enemy.damage(strike)
  end

end
