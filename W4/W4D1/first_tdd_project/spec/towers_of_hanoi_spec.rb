require "rspec"
require "towers_of_hanoi"

describe TowersOfHanoi do
  subject(:tower) { TowersOfHanoi.new }
  describe "initialize" do
    it "initialize a 2D array" do
      expect(tower.disks).to eq([[1,2,3,4], [], []])
    end
  end

  describe "move" do
    it "cannot move a larger disk onto a smaller disk" do
      tower.move(0, 2)
      expect {tower.move(0, 2)}.to raise_error("cannot move a larger disk onto a smaller disk!")
    end
  end

  describe "won" do
    it "all disks have been moved to the last tower" do
      tower.disks = [[],[],[1,2,3,4]]
      expect(tower.disks[0]).to be_empty
      expect(tower.disks[1]).to be_empty
    end
  end
end