class LightbulbsController < ApplicationController
  def index
    @lightbulbs = Lightbulb.filter(params.slice(:bulb_type, :fitting, :brightness))
    # redirect_to lightbulbs_path
    # @queried = params[:bulb] || params[:fitting] || params[:brightness]
    #@lightbulb = Lightbulb.first only if there is a search...
  end

  def show
    @lightbulb = Lightbulb.find(params[:id])
    @lightbulbs = Lightbulb.all
    @shops = Shop.all

    # Search for similar to above but different same brand
    @similar_bulb = Lightbulb.where(bulb_type: @lightbulb[:bulb_type], fitting: @lightbulb[:fitting], brand: "B&Q") 
    #&& Lightbulb.where.not(brand: @lightbulb[:brand])

    # the `geocoded` scope filters only lightbulbs with coordinates (latitude & longitude)
    @markers = @shops.geocoded.map do |shop|
      {
        lat: shop.latitude,
        lng: shop.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { shop: shop}),
        image_url: helpers.asset_url('lightbulb_icon.png')
      }
    end
  end
end
