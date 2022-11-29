class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
    @flats = Flat.all
  end

  def create
    @user = current_user
    @flat = set_flat
    @booking = Booking.new(strong_params)
    @booking.user = @user
    @booking.flat = @flat
    @booking.save
    redirect_to bookings_path
  end

  private

  def set_flat
    @flat = Flat.find(index_bookings_on_flat_id)
  end

  def set_booking
    @booking = Booking.find(:id)
  end

  def strong_params
    params.require(:booking).permit(:user_id, :flat_id, :confrimed)
  end
end
