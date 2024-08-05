require "rails_helper"

RSpec.describe Airline, type: :model do
  describe "relationships" do
    it { should have_many :flights }
  end

  describe "adult_passengers method" do
    before :each do
      @airline = Airline.create!(name: "Frontier")
      @flight1 = @airline.flights.create!(number: "1727", date: "08/03/20", departure_city: "Denver", arrival_city: "Reno")
      @flight2 = @airline.flights.create!(number: "1828", date: "08/04/20", departure_city: "Los Angeles", arrival_city: "New York")
  
      @passenger1 = Passenger.create!(name: "Joe", age: 12)
      @passenger2 = Passenger.create!(name: "Anna", age: 18)
      @passenger3 = Passenger.create!(name: "Bob", age: 25)
  
      @flight1.passengers << [@passenger1, @passenger2]
      @flight2.passengers << [@passenger1, @passenger3]
    end

    it "returns unique adult passengers for the airline" do
      expect(@airline.adult_passengers).to contain_exactly(@passenger2, @passenger3)
      expect(@airline.adult_passengers).to_not include(@passenger1)
    end
  end
end
