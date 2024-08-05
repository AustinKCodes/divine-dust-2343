class PassengerController < ApplicationController
  def destroy
    @flight = Flight.find(params[:id])
    @passenger = Passenger.find(params[:id])
    @flight.passengers.delete(@passenger)
  end
end