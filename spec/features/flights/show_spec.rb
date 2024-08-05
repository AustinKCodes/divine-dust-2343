require "rails_helper"

RSpec.describe "Airline Show page" do
  it "shows a unique list of adult passengers" do
    @airline = Airline.create!(name: "Frontier")
    @flight1 = @airline.flight.create!(number: "1727", date: "08/03/20", departure_city: "Denver", arrival_city: "Reno")
    @passenger1 = Passenger.create!(name: "Joe", age: 12)
    @passenger2 = Passenger.create!(name: "Anna", age: 18)
    @passenger3 = Passenger.create!(name: "Bob", age: 25)

    @flight1.passengers << [@passenger1, @passenger2, @passenger3]

    visit airline_path(@airline)

    expect(page).to have_content("Adult Passengers")
    expect(page).to have_content("Jane (Age: 18)")
    expect(page).to have_content("Bob (Age: 25)")
    expect(page).to_not have_content("Joe (Age: 12)")
  end
end