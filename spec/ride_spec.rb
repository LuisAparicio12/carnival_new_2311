require 'spec_helper'

RSpec.describe Ride do
    it 'exixts' do
        ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })

        expect(ride1).to be_an_instance_of Ride
    end 

    it 'can have attributes' do
        ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })

        expect(ride1.name).to eq("Carousel")
        expect(ride1.min_height).to eq(24)
        expect(ride1.admission_fee).to eq(1)
        expect(ride1.excitement).to eq(:gentle)
        expect(ride1.total_revenue).to eq(0)
    end

    it 'can board a rider' do
        ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
        visitor1 = Visitor.new('Bruce', 54, '$10')
        visitor2 = Visitor.new('Tucker', 36, '$5')
        visitor1.add_preference(:gentle)
        visitor2.add_preference(:gentle)

        ride1.board_rider(visitor1)
        ride1.board_rider(visitor2)
        ride1.board_rider(visitor1)
        expect(ride1.rider_log).to eq({"Bruce" => 2, "Tucker" => 1})
        expect(visitor1.spending_money).to eq(8)
        expect(visitor2.spending_money).to eq(4)
        expect(ride1.total_revenue).to eq(3)
    end

    it 'can have different rides and visitors' do
        ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
        ride2 = Ride.new({ name: 'Ferris Wheel', min_height: 36, admission_fee: 5, excitement: :gentle })
        ride3 = Ride.new({ name: 'Roller Coaster', min_height: 54, admission_fee: 2, excitement: :thrilling })
        visitor1 = Visitor.new('Bruce', 54, '$10')
        visitor2 = Visitor.new('Tucker', 36, '$5')
        visitor3 = Visitor.new('Penny', 64, '$15')
        visitor1.add_preference(:gentle)
        visitor2.add_preference(:gentle)
        ride1.board_rider(visitor1)
        ride1.board_rider(visitor2)
        ride1.board_rider(visitor1)

        expect(visitor2.add_preference(:thrilling)).to eq([:gentle, :thrilling])
        expect(visitor3.add_preference(:thrilling)).to eq([:thrilling])

        ride3.board_rider(visitor1)
        ride3.board_rider(visitor2)
        ride3.board_rider(visitor3)

        expect(visitor1.spending_money).to eq(8)
        expect(visitor2.spending_money).to eq(4)
        expect(visitor3.spending_money).to eq(13)
        expect(ride3.rider_log).to eq({"Penny" => 1})
        expect(ride3.total_revenue).to eq(2)
    end
end 