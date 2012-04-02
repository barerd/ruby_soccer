require "ruby_soccer/version"
require "ruby_soccer/world"
#require "ruby_soccer/team"
#require "ruby_soccer/player"

module RubySoccer
 
  def RubySoccer.dice(team1, team2, min)
    chance = rand(0)
    if chance > 0.5
      attacker = team1
      defender = team2
    else
      attacker = team2
      defender = team1
    end
    RubySoccer.round(attacker, defender, min)
    RubySoccer.faul(attacker, defender, min)
  end

  def RubySoccer.round(team1, team2, min)
    valid1 = team1.select { |p| p[5] != 1}
    valid2 = team2.select { |p| p[5] != 1}
    attack = 0
    defense = 0
    
    for i in (0..10) do
      attack += valid1[i][1]
    end
    for i in (0..10) do
      defense += valid2[i][2]
    end
    score = attack / defense * rand(0)
    if score > 0.96
      scorer = team1[rand(10)]
      if scorer[5] == 1
        scorer = team1[rand(10)]
      else
        nil
      end
      scorer[3] += 1
      reasons = ["corner", "direct attack", "free kick", "side attack", "speed kick"]
      reason = reasons[rand(4)]
      puts "#{scorer[0]} scored a goal through a #{reason} in #{min}. minute!"
    else
      nil
    end
  end

  def RubySoccer.faul(team1, team2, min)
    faul_chance = rand(0)
    if faul_chance> 0.97 && rand(10) % 2 == 0
        RubySoccer.faul_present(team1, min)
    elsif faul_chance> 0.97 && rand(10) % 2 == 1
        RubySoccer.faul_present(team2, min)
    else
      nil
    end
  end

  def RubySoccer.faul_present(team, min)
    playing_team = team.select { |p| p[5] != 1}
    faul_player = playing_team[rand(10)]
    if faul_player[4] == 1
      faul_player[5] = 1
      puts "#{faul_player[0]} gets a red card in #{min}. minute!"
      valid = team.select { |p| p[5] != 1 }
      if valid.count > 10
        puts "#{team[11][0]} is in the game now!"
      elsif valid.count < 11
        puts "The game is over in #{min}. minute because #{faul_player[0]} cannot be
  substituted!"
        Process.exit(0)
      end
    elsif faul_player[4] == 0
      faul_player[4] = 1
      puts "#{faul_player[0]} gets a yellow card in #{min}. minute!"
    else
      nil
    end
  end

  def RubySoccer.give_score(team1, team2)
    goal1 = 0
    goal2 = 0
    team1.each { |p| goal1 += p[3] }
    team2.each { |p| goal2 += p[3] }
    puts "Red Team scored a total of #{goal1} goals and Blue Team scored a total of #{goal2}
  goals."
    final = goal1 <=> goal2
    if final == 1
      puts "Red Team won against Blue Team by #{goal1}:#{goal2}!"
    elsif final == 0
      puts "It's a tie!"
    else
      puts "Blue Team won against Red Team by #{goal2}:#{goal1}!"
    end
  end

  def RubySoccer.list_goals(team1, team2)
    team1 = team1.select { |p| p[3] == 1 }
    team2 = team2.select { |p| p[3] == 1 }

    if team1.count > 0
      puts "Goals for Red Team were scored by:"
      team1.each { |p| puts p[0]}
    else
      nil
    end

    if team2.count > 0
      puts "Goals for Blue Team were scored by:"
      team2.each { |p| puts p[0]}
    else
      nil
    end
  end

  def RubySoccer.list_cards(team1, team2)
    team = team1 + team2
    yellow = team.select { |p| p[4] == 1 }
    red = team.select { |p| p[5] == 1 }

    if yellow.count > 0
      puts "Players shown a yellow card are:"
      yellow.each { |p| puts p[0]}
    else
      puts "No yellow cards!"
    end

    if red.count > 0
      puts "Players shown a red card are:"
      red.each { |p| puts p[0]}
    else
      puts "No red cards!"
    end   
  end

  def RubySoccer.match(team1, team2, min = 0)
    for min in (1...90) do
      RubySoccer.dice(team1, team2, min)
      min += 1
    end
    RubySoccer.give_score(team1, team2)
    RubySoccer.list_goals(team1, team2)
    RubySoccer.list_cards(team1, team2)
  end
end
