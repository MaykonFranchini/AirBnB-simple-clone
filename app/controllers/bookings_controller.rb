class BookingsController < ApplicationController

  def new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user == current_user
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:check_in, :check_out)
  end
end
