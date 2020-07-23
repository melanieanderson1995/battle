require_relative "player"

class Game
  attr_reader :current_turn, :players

  def initialize(player_1, player_2)
    @players = [player_1, player_2]
    @current_turn = player_1
  end

  def self.instance
    @game
  end

  def self.create(player_1, player_2)
    @game = Game.new(player_1, player_2)
  end

  def player_1
    @players.first
  end

  def player_2
    @players.last
  end

  def attack(player)
    player.lose_points
  end

  def paralyze(player)
    player.lose_turn
  end

  def switch_turn
    @current_turn = opponent_of
  end

  def game_over?
    !!losing_player
  end

  def opponent_of(player = @current_turn)
    player == player_1 ? player_2 : player_1
  end

  def loser
    losing_player
  end

  def losing_player
    @players.select { |player| player.hit_points <= 0 }.first
  end

  def losing_players
    players.select { |player| player.hit_points <= 0 }
  end

end
