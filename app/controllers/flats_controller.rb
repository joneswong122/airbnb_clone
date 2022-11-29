class FlatsController < ApplicationController
  def index
    @flats = Flat.all
  end

  def new
    @flat = Flat.new
  end

  def create
    @user = current_user
    @flat = Flat.new(strong_params)
    @flat.user = @user
    @flat.save
    redirect_to flats_path
    # redirect_to flat_path(@flat)
  end

  private

  def strong_params
    params.require(:flat).permit(:user_id, :price, :address, :room_type, :total_occupancy)
  end
end
