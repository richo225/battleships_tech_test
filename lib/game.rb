class Game

  attr_accessor :ships, :computer

  def initialize
    @ships = []
    @computer = []
  end

  def position(cell)
    @ships << cell
  end

  def start
    (@computer << random_ships).flatten!
  end

  private

  def random_ships
    (1..100).to_a.sample(5)
  end

end
