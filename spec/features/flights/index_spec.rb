require "rails_helper"

RSpec.describe "Flights Index Page" do
  before :each do
    @airline1 = Airline.create!(name: "Frontier")
    @airline2 = Airline.create!(name: "Southwest")

    @flight1 = @airline1.flights.create!(number: "1727", date: "08/03/20", departure_city: "Denver", arrival_city: "Reno")
    @flight2 = @airline2.flights.create!(number: "1828", date: "08/04/20", departure_city: "Los Angeles", arrival_city: "New York")

    @passenger1 = Passenger.create!(name: "Joe", age: 18)
    @passenger2 = Passenger.create!(name: "Anna", age: 30)
    @passenger3 = Passenger.create!(name: "Mike", age: 25)

    @flight1.passengers << [@passenger1, @passenger2]
    @flight2.passengers << [@passenger2, @passenger3]
  end

  it "shows a list of all flight numbers" do
    visit flights_path

    expect(page).to have_content(@flight1.number)
    expect(page).to have_content(@flight2.number)
  end

  it "shows the name of the airline next to each flight number" do
    visit flights_path

    within "#flight-#{@flight1.id}" do
      expect(page).to have_content(@airline1.name)
    end

    within "#flight-#{@flight2.id}" do
      expect(page).to have_content(@airline2.name)
    end
  end

  it "shows the name of all passengers under each flight number" do
    visit flights_path

    within "#flight-#{@flight1.id}" do
      expect(page).to have_content(@passenger1.name)
      expect(page).to have_content(@passenger2.name)
    end

    within "#flight-#{@flight2.id}" do
      expect(page).to have_content(@passenger2.name)
      expect(page).to have_content(@passenger3.name)
    end
  end
end