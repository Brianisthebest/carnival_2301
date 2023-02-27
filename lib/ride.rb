class Ride
  attr_reader :name, 
              :min_height, 
              :admission_fee, 
              :excitement,
              :total_revenue, 
              :rider_log,
              :total_rides

  def initialize(ride_details)
    @name = ride_details[:name]
    @min_height = ride_details[:min_height]
    @admission_fee = ride_details[:admission_fee]
    @excitement = ride_details[:excitement]
    @total_revenue = 0
    @rider_log = Hash.new(0)
    @total_rides = Hash.new(0)
  end

  def board_rider(visitor)
    if has_preference?(visitor) && meets_height_requirements(visitor)
      @rider_log[visitor] += 1
      take_payment(visitor)
      add_ride_count
      @total_revenue += admission_fee
    end
  end

  def has_preference?(visitor)
    visitor.preferences.include?(@excitement)
  end

  def meets_height_requirements(visitor)
    visitor.height >= min_height
  end

  def take_payment(visitor)
    visitor.spending_money -= @admission_fee
  end

  def add_ride_count
    @total_rides[@name] += 1
    @total_rides
  end
end
