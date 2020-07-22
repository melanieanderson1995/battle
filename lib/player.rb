require_relative "game"

class Player
  attr_reader :name, :hit_points, :current_turn
  DEFAULT_HP = 50

  def initialize(name, hit_points = DEFAULT_HP)
    @name = name
    @hit_points = hit_points
  end

  def lose_points
    @hit_points -= 10
  end

  def lose_turn
    @current_turn = Game.opponent_of(current_turn)
    @current_turn.switch_turn
  end

end
