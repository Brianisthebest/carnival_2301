class Carnival
  attr_reader :name, :duration, :rides

  def initialize(name, duration)
    @name = name
    @duration = duration
    @rides = []
    @summary = Hash.new
  end

  def add_ride(ride)
    @rides.push(ride)
  end

  def most_popular_ride
    most_pop = @rides.max_by { |ride| ride.total_rides }
  end

  def most_profitable_ride
    most_prof = @rides.max_by { |ride| ride.total_revenue }
  end

  def total_revenue
    @rides.sum { |ride| ride.total_revenue }
  end

  def summary
    total_vis = @rides.sum { |ride| ride.total_rides }
    @summary[:visitor_count] = total_vis
    @summary[:revenue_earned] = total_revenue
    @summary
  end
end
