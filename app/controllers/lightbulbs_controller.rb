class LightbulbsController < ApplicationController
  def index
    if params[:bulb_type || :fitting || :brightness].nil?
      @lightbulbs = nil
    else
      @lightbulbs = Lightbulb.filter(params.slice(:bulb_type, :fitting, :brightness))
    end
  end

  def upload
    
  end

  def load
    # redirect_to lightbulbs_search_path
  end

  def search
    # Code that scans photo for info
    # resource = OcrSpace::Resource.new(apikey: ENV['OCR_API_KEY'])
    # result = resource.clean_convert url: "https://i.ibb.co/f9Vmk0F/ocr-data.png"
    # bulb_type = result.scan(/(led)/i).flatten.first.to_s
    # brightness = result.scan(/\d/i).join('').to_s
    # fitting = result.scan(/(screw)/i).flatten.first.to_s.capitalize
    bulb_type = "GLS"
    brightness = "810"
    fitting = "Bayonet"

    @lightbulbs = Lightbulb.where({ bulb_type: bulb_type, fitting: fitting, brightness: brightness })
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
