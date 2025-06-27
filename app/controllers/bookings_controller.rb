class BookingsController < ApplicationController
  def new
    @flight = Flight.find(params[:flight_id])
    @booking = Booking.new(flight: @flight)
    num_passengers = params[:num_passengers].to_i
    num_passengers.times { @booking.passengers.build }
  end

  def create
    @booking = Booking.new(booking_params)

    if @booking.save
      puts "Booking ID: #{@booking.id}"
      redirect_to @booking, notice: "Booking Successfull"
    else
      flash.now[:alert] = "Something went wrong"
      puts @booking.errors.full_messages
      @flight = @booking.flight
      render :new
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  private

  def booking_params
    params.require(:booking).permit(:flight_id, passengers_attributes: [ :name, :email ])
  end
end
