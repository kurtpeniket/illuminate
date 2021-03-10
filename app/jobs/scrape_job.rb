require 'nokogiri'
require 'open-uri'
# require 'rest-client'

class ScrapeJob < ApplicationJob
  queue_as :default

  def perform(*args)
    screwfix_scrape('https://www.screwfix.com/c/electrical-lighting/light-bulbs/cat8350001?capfittingtype=es|ses', 'Screw')
    screwfix_scrape('https://www.screwfix.com/c/electrical-lighting/light-bulbs/cat8350001?capfittingtype=bc#category=cat8350001&capfittingtype=bc&page_size=100', 'Bayonet')
    screwfix_scrape('https://www.screwfix.com/c/electrical-lighting/light-bulbs/cat8350001?capfittingtype=gu10&page_size=100', 'Other')
    bandq_lightbulb_scrape('https://www.diy.com/departments/lighting/light-bulbs/DIY780138.cat?Cap+fitting+code=B22', 'Bayonet')
    bandq_lightbulb_scrape('https://www.diy.com/departments/lighting/light-bulbs/DIY780138.cat?Cap+fitting+code=E27', 'Screw')
    bandq_lightbulb_scrape('https://www.diy.com/departments/lighting/light-bulbs/DIY780138.cat?Cap+fitting+code=GU10', 'Other')
  end

  def screwfix_scrape(url, fitting)
    lumens_regex = /\d*lm/i
    bulb_regex = /\b(led|gls|clf|halogen|incandescent)\b/i
    price_regex = /£\d+(?:[.,]\d+)?/i

    file = URI.open(url)
    # file = RestClient.get(url).body
    doc = Nokogiri::HTML(file)

    doc.search('.lii__offer').each do |element|
      bulb_type = element.text.scan(bulb_regex).flatten[0],
      brightness = element.text.scan(lumens_regex)[0],
      price = element.text.scan(price_regex).first.to_s,
      url = element.search("a").attribute("href").value,
      image = element.search("img#product_image").attribute("src").value
      Lightbulb.create(
        bulb_type: bulb_type.first,
        fitting: fitting,
        brand: 'Screwfix',
        brightness: brightness,
        price: price,
        url: url,
        image: image
      )
    end
  end

  def validate(variable)
    return variable != nil && variable.length > 2
  end

  def bandq_lightbulb_scrape(url, fitting)
    lumens_regex = /\d*lm/i
    bulb_type_regex = /\b(led|gls|incandescent|clf|halogen)\b/i
    price_regex = /£\d+(?:[.,]\d+)?/i

    file = URI.open(url)
    doc = Nokogiri::HTML(file)
    results = doc.search('li')

    results.each do |element|
      url_search = element.search("a").attribute("href")
      img_search = element.search("img").attribute("src")
      if img_search
        image = img_search.value
      end
      if url_search
        url = "https://www.diy.com/#{url_search.value}"
      end
      price = element.text.scan(price_regex).first.to_s
      brightness = element.text.scan(lumens_regex).first.to_s
      bulb_type = element.text.scan(bulb_type_regex).flatten[0]

      if validate(bulb_type) && validate(brightness) && validate(price) && validate(image) && validate(url)
        Lightbulb.create(
          bulb_type: bulb_type,
          brand: "B&Q",
          fitting: fitting,
          brightness: brightness,
          price: price,
          image: image,
          url: url
        )
      else
        puts "Invalid data"
      end
    end
  end
end
