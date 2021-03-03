class LightbulbsController < ApplicationController
  def index
    @lightbulbs = Lightbulb.filter(params.slice(:bulb_type, :fitting, :brightness))
  end

  def show
  end
end
