class Player
  attr_reader :name, :attack, :defense
  attr_writer :goal, :yellow, :red
  
  def initialize(name)
    @name = name
    @attack = 70 + rand(30)
    @defense = 70 + rand(30)
    @goal = 0
    @yellow = 0
    @red = 0
  end
end
