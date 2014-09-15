class QuestMath
  attr_accessor :target, :attack_enemy
  def initialize
    @enemies = []
    @ambushed = false
    @ambush = true
    @target = 99999
    @battle_over = false
    @attack_queue = true
  end

  def random_generator
    return rand(1..(14-$player.party.size))
  end

  def enemy_generator
    if @enemies == []
      rand(1..8).times do |n|
        @enemies.push(Grunt.new)
      end
    end
  end

  def encounters
    @encounters = ["ambushed","ambush","nothing"]
    encounter = @encounters.sample
    if encounter == "ambushed"
      puts "you party is ambushed by #{@enemies.size} #{@enemies[0].name}"
      @ambushed = true
      the_question
    elsif encounter == "ambush"
      puts "your party ambushed #{@enemies.size} #{@enemies[0].name}"
      @ambush = true
      the_question
    else 
      puts "your party finds nothing"
    end
  end

  def battle_over?
    total_enemies = @enemies.size
    total_dead = 0
    @enemies.each do |enemy|
      if enemy.is_dead? == true
        total_dead += 1
      end
    end
    if total_dead == total_enemies
      @player_won = true
      @battle_over = true
    end
    total_party_dead = 0
    $player.party.each do |footman|
      if footman.is_dead? == true
        total_party_dead += 1
      end
    end
    if total_party_dead == $player.party.size
      @battle_over = true
      @player_won = false
    end
  end

  
  def the_question
    battle_over?
    if @battle_over == false
      @random_number_one = random_generator
      @random_number_two = random_generator
      @correct_answer = @random_number_one * @random_number_two
      battle_ground("==========")
      puts "Ready?"
      attack_ambush_enemy(gets.chomp.to_i)
    elsif @battle_over == true && @player_won == true
      $player.footmen.each_with_index do |footman,index|
        if footman.is_dead?
          $player.footmen.delete_at(index)
          the_question
        else
        footman.health_points += rand(1..60)
        end
      end
      you_win
    else
      you_lose
    end
  end

  def you_lose
    $game.announcer = "you lose the battle"
    $player.footmen.each_with_index do |footman,index|
      if footman.is_dead?
        $game.announcer += " RIP #{footman.government_name}"
        $game.days += 5
        $player.footmen.delete_at(index)
        you_lose
      end
    end
    @battle_over = false
  end

  def you_win
    @enemies.each_with_index do |enemy,index|
      if enemy.is_dead?
        @enemies.delete_at(index)
        you_win
      end
    end
    $game.announcer = "you have won the battle"
    lumber = rand(1..10)* @enemies.size
    gold = rand(1..50) * @enemies.size
    $game.announcer += " +#{gold} GOLD +#{lumber} LUMBER"
    $player.gold += gold
    $player.lumber += lumber
    $game.days += 5
    @battle_over = false
  end

  def battle_ground(question)
     @enemies.each do |enemy|
      puts "#{enemy.name} HP:#{enemy.health_points}"
    end
    puts "===========#{question}=============="
    $player.party.each do |footman|
      puts "#{footman.government_name} HP: #{footman.health_points} XP:#{footman.xp}"
    end
  end

  def attack_ambush_enemy(index)
    battle_ground("   #{@random_number_one} x #{@random_number_two}   ")
    puts "#{@random_number_one} x #{@random_number_two} ="
    answer = gets.chomp.to_i
    if answer == @correct_answer
      $player.party.each do |footman|
        footman.xp += rand(0..22)
        @enemies.each do |enemy|
          if enemy.is_dead? == false
            puts footman.government_name+": "+footman.battle_cry
            footman.attack(enemy)
          end
        end
      end
    end
    enemy_attack_ambushed
  end

  def enemy_attack_ambushed
    puts "enemey attacks"
    @enemies.each do |enemy|
      target = $player.party[rand(0..($player.party.size-1))]
      enemy.attack(target)
      puts enemy.name + ": " + enemy.battle_cry.sample
      end
    puts
    the_question
  end


end