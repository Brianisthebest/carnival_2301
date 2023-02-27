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
    total = @rides.sum do |ride|
      ride.total_rides
    end
    @summary[:visitor_count] = total
    @summary[:total_revenue] = total_revenue
    require 'pry'; binding.pry
  end
end
