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
    end
  end
end
