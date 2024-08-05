class FlightsController < ApplicationController
  def index
    @flights = Flight.includes(:airline, :passengers).all
  end
end