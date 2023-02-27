class Carnival
  attr_reader :name, :duration, :rides

  def initialize(name, duration)
    @name = name
    @duration = duration
    @rides = []
  end

  def add_ride(ride)
    @rides.push(ride)
  end

  def most_popular_ride
    most_pop = @rides.max_by do |ride|
      ride.total_rides
    end
    most_pop
  end

  def most_profitable_ride
    most_prof = @rides.max_by do |ride|
      ride.total_revenue
    end
    most_prof
  end

  def total_revenue
    @rides.sum do |ride|
      ride.total_revenue
    end
  end
end
