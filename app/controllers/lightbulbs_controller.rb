class LightbulbsController < ApplicationController
  def index
    @ligthbulbs = Lightbulb.all
  end

  def show
  end
end
