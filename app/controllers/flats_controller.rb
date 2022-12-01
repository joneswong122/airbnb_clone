class FlatsController < ApplicationController
  def index
    @flats = Flat.all
    user
  end

  def new
    @flat = Flat.new
  end

  def create
    user
    @flat = Flat.new(strong_params)
    @flat.user = @user
    @user.owner = true
    @flat.save
    redirect_to flats_path # index
    # redirect_to flat_path(@flat) # show
  end

  def show
    @flat = Flat.find(params[:id])
    @booking = Booking.new
    user
  end

  private

  def user
    @user = current_user
  end

  def strong_params
    params.require(:flat).permit(:user_id,:title, :city, :price, :address, :room_type, :total_occupancy, :photo)
  end
end
