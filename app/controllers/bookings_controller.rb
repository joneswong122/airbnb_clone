class BookingsController < ApplicationController
  before_action :set_flat, only: [:create]
  def index
    @user = current_user
    @bookings = Booking.all
    @flats = Flat.all
  end

  def show
    # bookings/:id
    set_booking
    @flats = Flat.all
  end

  def create
    # flats/:flat_id/bookings
    @user = current_user
    @booking = Booking.new(strong_params)
    @booking.user = @user
    @booking.flat = @flat
    @booking.save
    # redirect_to bookings_path
    redirect_to booking_path(@booking)
  end

  private

  def set_flat
    @flat = Flat.find(params[:flat_id])
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def strong_params
    params.require(:booking).permit(:user_id, :flat_id, :confirm)
  end
end
