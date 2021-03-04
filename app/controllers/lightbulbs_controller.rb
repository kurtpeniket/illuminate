class LightbulbsController < ApplicationController
  def index
    @lightbulbs = Lightbulb.filter(params.slice(:bulb_type, :fitting, :brightness))
  end

  def show
    @lightbulb = Lightbulb.find(params[:id])
    # raise
    @lightbulbs = Lightbulb.all
    @shops = Shop.all

    #the `geocoded` scope filters only lightbulbs with coordinates (latitude & longitude)
    @markers = @shops.geocoded.map do |shop|
      {
        lat: shop.latitude,
        lng: shop.longitude
      }
    end
  end
end
