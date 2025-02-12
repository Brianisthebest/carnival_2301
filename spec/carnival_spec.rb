require 'rspec'
require './lib/visitor'
require './lib/ride'
require './lib/carnival'

RSpec.describe Carnival do
  before(:each) do
    @carnival = Carnival.new('Wacky Tacky Carnival', 10)
    @ride1 = Ride.new({ name: 'Carousel', 
                        min_height: 24, 
                        admission_fee: 1, 
                        excitement: :gentle 
                        })
    @ride2 = Ride.new({ name: 'Ferris Wheel', 
                        min_height: 36, 
                        admission_fee: 5, 
                        excitement: :gentle
                        })
    @ride3 = Ride.new({ name: 'Roller Coaster', 
                        min_height: 54,
                        admission_fee: 2, 
                        excitement: :thrilling 
                        })
    @visitor1 = Visitor.new('Bruce', 54, '$10')
    @visitor2 = Visitor.new('Tucker', 36, '$5')
    @visitor3 = Visitor.new('Penny', 64, '$15')
  end

  describe '#initialize' do
    it 'exists and has attributes' do
      expect(@carnival).to be_a(Carnival)
      expect(@carnival.name).to eq('Wacky Tacky Carnival')
      expect(@carnival.duration).to eq(10)
      expect(@carnival.rides).to eq([])
    end
  end

  describe '#add_ride' do
    it 'can add rides to the carnival' do
      expect(@carnival.add_ride(@ride1)).to eq([@ride1])
      expect(@carnival.add_ride(@ride2)).to eq([@ride1, @ride2])
      expect(@carnival.add_ride(@ride3)).to eq([@ride1, @ride2, @ride3])
    end
  end

  describe '#most_popular' do
    it 'returns the most popular ride' do
      @carnival.add_ride(@ride1)
      @carnival.add_ride(@ride3)
      @visitor1.add_preference(:gentle)
      @visitor2.add_preference(:gentle)
      @visitor2.add_preference(:thrilling)
      @ride1.board_rider(@visitor1)
      @ride1.board_rider(@visitor2)
      @ride1.board_rider(@visitor1)
      @ride3.board_rider(@visitor2)
      @carnival.most_popular_ride
      expect(@carnival.most_popular_ride).to eq(@ride1)
    end
  end

  describe '#most_profitable' do
    it 'returns the most profitable ride' do
      @carnival.add_ride(@ride1)
      @carnival.add_ride(@ride3)
      @visitor1.add_preference(:gentle)
      @visitor3.add_preference(:gentle)
      @visitor3.add_preference(:thrilling)
      @ride1.board_rider(@visitor1)
      @ride1.board_rider(@visitor3)
      @ride1.board_rider(@visitor1)
      @ride3.board_rider(@visitor3)
      expect(@carnival.most_profitable_ride).to eq(@ride1)
    end
  end

  describe '#total_revenue' do
    it 'can calculate the total revenue for all rides' do
      @carnival.add_ride(@ride1)
      @carnival.add_ride(@ride3)
      @visitor1.add_preference(:gentle)
      @visitor3.add_preference(:gentle)
      @visitor3.add_preference(:thrilling)
      @ride1.board_rider(@visitor1)
      @ride1.board_rider(@visitor3)
      @ride1.board_rider(@visitor1)
      @ride3.board_rider(@visitor3)
      expect(@carnival.total_revenue).to eq(5)
    end
  end

  describe '#summary_hash' do
    it 'returns a hash for the summary' do
      @carnival.add_ride(@ride1)
      @carnival.add_ride(@ride3)
      @visitor1.add_preference(:gentle)
      @visitor3.add_preference(:gentle)
      @visitor3.add_preference(:thrilling)
      @ride1.board_rider(@visitor1)
      @ride1.board_rider(@visitor3)
      @ride1.board_rider(@visitor1)
      @ride3.board_rider(@visitor3)

      expect(@carnival.summary).to eq({:visitor_count => 4, :revenue_earned => 5})
    end
  end

  describe '#riders_fav_ride' do
    # 2. then add list of visitors and their fav ride and money spent
    xit 'lists the riders, the fav rides, and total amount spend on ride' do
      # iterate over rides and then rider_log
      # make a hash to lists riders => fav and money spent
      @carnival.add_ride(@ride1)
      @carnival.add_ride(@ride3)
      @visitor1.add_preference(:gentle)
      @visitor3.add_preference(:gentle)
      @visitor3.add_preference(:thrilling)
      @ride1.board_rider(@visitor1)
      @ride1.board_rider(@visitor1)
      @ride3.board_rider(@visitor3)
      @ride3.board_rider(@visitor3)

      expect(@carnival.riders_fav_ride).to eq({@rider1 => @ride1, @rider3 => @ride3})
    end
  end
end

# 3. then add list of rides and who rode each ride and the total rev
# 4. calculate the total revenue of all carnivals