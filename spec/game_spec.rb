require "./lib/game"

describe Game do
  subject(:game) { described_class.new(player_1, player_2) }
  subject(:finished_game) { described_class.new(dead_player, player_2) }
  let(:player_1) { double :player, hit_points: 50 }
  let(:player_2) { double :player, hit_points: 50 }
  let(:dead_player) { double :player, hit_points: 0 }

  describe '#player_1' do
    it 'retrieves the first player' do
      expect(game.player_1).to eq player_1
    end
  end

  describe '#player_2' do
    it 'retrieves the second player' do
      expect(game.player_2).to eq player_2
    end
  end

  describe "#opponent_of" do
    it "finds the opponent of current_turn player" do
      expect(game.opponent_of(player_1)).to eq player_2
      expect(game.opponent_of(player_2)).to eq player_1
    end
  end

  describe '#attack' do
    it 'damages the player' do
      expect(player_2).to receive(:lose_points)
      game.attack(player_2)
    end
  end

  describe '#paralyze' do
    it 'makes the player lose a turn' do
      expect(player_2).to receive(:lose_turn)
      game.paralyze(player_2)
    end
  end

  describe "#current_turn" do
    it "starts as player 1" do
      expect(game.current_turn).to eq player_1
    end
  end

  describe "#switches turns" do
    it "switches turns" do
      game.switch_turn
      expect(game.current_turn).to eq player_2
    end
  end

  describe "#game_over?" do
    it "returns false if no one is at 0 HP" do
      expect(game.game_over?).to be false
    end

    it "returns true if one player is at 0 HP" do
      expect(finished_game.game_over?).to be true
    end
  end

  describe "#loser" do
    it "returns a player on less than 0 HP" do
      expect(finished_game.loser).to eq loser
    end
  end
end
