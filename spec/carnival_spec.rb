require 'spec_helper'

RSpec.describe Carnival do
    it 'exixts' do
        carnival = Carnival.new(14)

        expect(carnival).to be_an_instance_of Carnival
    end

    it 'can have a duration and add a ride' do
        carnival = Carnival.new(14)
        ride1 = Ride.new({name: "Roller Coaster", min_height: 54, admission_fee: 5, excitement: :high })
        ride2 = Ride.new({name: "Carousel", min_height: 36, admission_fee: 2, excitement: :gentle})

        expect(carnival.duration).to eq(14)
        expect(carnival.rides).to be_an Array

        carnival.add_ride(ride1)
        carnival.add_ride(ride2)
        expect(carnival.rides).to eq([ride1, ride2])
    end 

    it 'can have a most popular ride' do
        carnival = Carnival.new(14)
        ride1 = Ride.new({name: "Roller Coaster", min_height: 54, admission_fee: 5, excitement: :high })
        ride2 = Ride.new({name: "Carousel", min_height: 36, admission_fee: 2, excitement: :gentle})
        carnival.add_ride(ride1)
        carnival.add_ride(ride2)

        expect(carnival.most_popular_ride).to eq(ride1)
    end

    it 'can have a most profitable ride' do
        carnival = Carnival.new(14)
        ride1 = Ride.new({name: "Roller Coaster", min_height: 54, admission_fee: 5, excitement: :high })
        ride2 = Ride.new({name: "Carousel", min_height: 36, admission_fee: 2, excitement: :gentle})
        carnival.add_ride(ride1)
        carnival.add_ride(ride2)

        expect(carnival.most_profitable_ride).to eq(ride1)
    end

    it 'has a total revenue of rides' do
        carnival = Carnival.new(7)
        ride1 = Ride.new({name: "Roller Coaster", min_height: 54, admission_fee: 5, excitement: :high })
        ride2 = Ride.new({name: "Carousel", min_height: 36, admission_fee: 2, excitement: :gentle})
        carnival.add_ride(ride1)
        carnival.add_ride(ride2)

        expect(carnival.total_revenue).to eq(0)
    end 
end 