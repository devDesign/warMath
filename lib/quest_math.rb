class QuestMath
  attr_accessor :attack_enemy
  def initialize
    @enemies = [Sheep.new,Sheep.new,Sheep.new]  
    @ambushed = false
    @ambush = true
  end

  def random_generator
    return rand($player.party.size..$player.party.size * 2)
  end

  def enemy_generator
    @enemies
  end

  def encounters
    @encounters = ["ambushed","ambush","nothing"]
    encounter = @encounters.sample
    if encounter == "ambushed"
      puts "you party is ambushed by #{@enemies.size} #{@enemies[0].name}"
      @ambushed = true
      the_question
    elsif encounter == "ambush"
      puts "your party spoted #{@enemies.size} #{@enemies[0].name}"
      @ambush = true
      the_question
    else 
      puts "your party finds nothing"
    end
  end
  
  def the_question
    @random_number_one = random_generator
    @random_number_two = random_generator
    @correct_answer = @random_number_one * @random_number_two
    @enemies.each_with_index do |enemy,index|
      puts "#{index+1}: #{enemy.name} HP:#{enemy.health_points}"
    end
    puts "your party"
    $player.party.each do |footman|
      puts "#{footman.government_name} HP: #{footman.health_points} XP:#{footman.xp}"
    end
    puts "select enemy to attack:"
    attack_enemy(gets.chomp.to_i)
  end


  
  def attack_enemy(index)
    enemy = @enemies[index-1]
    puts "#{@random_number_one} x #{@random_number_two} ="
    answer = gets.chomp.to_i
    if answer == @correct_answer
      $player.party.each do |footman|
        puts "#{footman.government_name} strike #{enemy.name} with #{footman.strike} damage."
        enemy.health_points -= footman.strike
      end
    end
    gets
    enemy_attack
  end

  def enemy_attack
    puts "enemey attacks"
    @enemies.each do |enemy|
      target = $player.party.sample
      puts "#{enemy.name} attacks #{target.government_name} with #{enemy.attack_power} damage"
    end
    gets
    the_question
  end


end