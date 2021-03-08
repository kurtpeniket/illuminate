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
