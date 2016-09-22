require "game"

describe Game do

  let(:game){Game.new}

  it "user begins with an empty board" do
    expect(game.ships).to be_empty
  end

  it "can position a ship" do
    game.position(2)
    expect(game.ships).to include(2)
  end

  it "computer has no ships until game starts" do
    expect(game.computer).to be_empty
  end

  it "starting a game deploys 5 ships for computer" do
    allow(game).to receive(:random_ships) {[1,2,3,4,5]}
    game.start    
    expect(game.computer).to eq([1,2,3,4,5])
  end

end
