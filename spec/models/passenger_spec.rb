require "rails_helper"

Rspec.describe Passegner, type: :model do
  describe "relationships" do
    it { should have_many(:flight_passengers) }
    it { should have_many(:flights).through(:flight_passengers) }
  end
end