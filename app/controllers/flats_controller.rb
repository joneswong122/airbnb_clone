class FlatsController < ApplicationController

  def index
    @flats = Flat.all
  end

  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.new(strong_params)
    @flat.save
    # redirect_to flat_path(@flat)
  end

  private

  def strong_params
    params.require(:flat).permit(:id, :price, :address, :room_type, :total_occupancy)
  end
end
