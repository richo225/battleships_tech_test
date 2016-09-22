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

  def fire(cell)
    hit?(cell)? sink_ship(cell) : fire_back(random_shot)
  end

  def fire_back(cell)
    @ships.delete(cell) if hit_back?(cell)
    puts "You have lost!" if @ships.empty?
  end

  def sink_ship(cell)
    @computer.delete(cell)
    puts "You are victorious!" if @computer.empty?
  end

  private

  def random_ships
    (1..100).to_a.sample(5)
  end

  def random_shot
    rand(101)
  end

  def hit?(cell)
    @computer.include?(cell)
  end

  def hit_back?(cell)
    @ships.include?(cell)
  end

end
