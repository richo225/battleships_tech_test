require "game"

describe Game do

  let(:game){Game.new}

  context "user" do

    it "user begins with an empty board" do
      expect(game.ships).to be_empty
    end

    it "can position a ship" do
      game.position(2)
      expect(game.ships).to include(2)
    end

    it "hitting a ship removes it" do
      game.computer = [1,2,3,4,5]
      game.fire(3)
      expect(game.computer).to eq([1,2,4,5])
    end

    it "hits are displayed" do
      game.computer = [1,2,3,4,5]
      expect{ game.fire(3) }.to output("Hit!\n").to_stdout
    end

    it "misses are displayed" do
      game.computer = [1,2,3,4,5]
      expect{ game.fire(81) }.to output("Miss!\n").to_stdout
    end

    it "user wins if all computer ships are sunk" do
      game.computer = [3]
      expect{ game.fire(3) }.to output("You are victorious!\n").to_stdout
    end

    it "user loses if all their ships are sunk" do
      game.ships = [99]
      expect{ game.fire_back(99) }.to output("You have lost!\n").to_stdout
    end
  end

  context "computer" do

    it "computer has no ships until game starts" do
      expect(game.computer).to be_empty
    end

    it "starting a game deploys 5 ships for computer" do
      allow(game).to receive(:random_ships) {[1,2,3,4,5]}
      game.start
      expect(game.computer).to eq([1,2,3,4,5])
    end

    it "hitting a user's ship removes it" do
      game.ships = [5,6,7,8,9]
      game.fire_back(9)
      expect(game.ships).to eq([5,6,7,8])

    end
  end
end
