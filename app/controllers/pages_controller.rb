require 'open-uri'
require 'rest-client'
class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    url = 'https://www.screwfix.com/c/electrical-lighting/light-bulbs/cat8350001?capfittingtype=es|ses'

    file = RestClient.get(url)
  end
end
