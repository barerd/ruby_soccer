class Team
  attr_reader :player
  
  def initialize
    @name_list = []
    File.open("players.txt", "r").each_line {|l| @name_list.push(l.chomp)}
    for i in (1..15) do
      @player[i] = Player.new(@name_list[i])
      @name_list.delete_at(i)
    end
  end
end
