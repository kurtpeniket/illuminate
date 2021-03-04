class LightbulbsController < ApplicationController
  def index
    @lightbulbs = Lightbulb.filter(params.slice(:bulb_type, :fitting, :brightness))
    #@lightbulb = Lightbulb.first only if there is a search...
  end

  def show
    @lightbulb = Lightbulb.find(params[:id])
    # raise
    @lightbulbs = Lightbulb.all

    # the `geocoded` scope filters only lightbulbs with coordinates (latitude & longitude)
    @markers = @lightbulbs.geocoded.map do |lightbulb|
      {
        lat: lightbulb.latitude,
        lng: lightbulb.longitude
      }
    end
  end
end
