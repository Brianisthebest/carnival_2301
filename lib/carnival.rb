class Carnival
  attr_reader :name, :duration, :rides

  def initialize(name, duration)
    @name = name
    @duration = duration
    @rides = []
    @most_populare = Hash.new
  end

  def add_ride(ride)
    @rides.push(ride)
  end
end
