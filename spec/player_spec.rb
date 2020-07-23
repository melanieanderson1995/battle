require "player"

describe Player do
  subject(:lanie) { Player.new("Lanie") }
  subject(:ada) { Player.new("Ada")}

  describe "#name" do
    it "returns Player name" do
      expect(lanie.name).to eq "Lanie"
    end
  end

  describe "#hit_points" do
    it "returns the hit points" do
      expect(lanie.hit_points).to eq Player::DEFAULT_HP
    end

    it "lowers hit points randomly" do
      srand(67809)
      subject.lose_points
      expect(subject.hit_points).to eq 48
    end
  end
end
