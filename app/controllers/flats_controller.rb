class FlatsController < ApplicationController
  def index
    @flats = Flat.all
    @user = current_user
  end

  def new
    @flat = Flat.new
  end

  def create
    @user = current_user
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
  end

  private

  def strong_params
    params.require(:flat).permit(:user_id, :price, :address, :room_type, :total_occupancy)
  end
end
