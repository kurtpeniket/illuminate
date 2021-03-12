require 'nokogiri'
require 'open-uri'

puts 'Cleaning DB...'
Favourite.destroy_all
Shop.destroy_all
Lightbulb.destroy_all
User.destroy_all
puts 'Seeding new DB...'

ScrapeJob.perform_now


shops_details = [
  ['Argos', '66 Cheapside, London, UK'],
  ['Wickes', '255 Finchley Rd, London, UK'],
  ['B&Q', '304-322 Norwood Road, London, UK'],
  ['screwfix', '107 Queensway, London, UK']
]

number = 0

4.times do
  shop = Shop.create(
    name: shops_details[number][0],
    address: shops_details[number][1]
  )
  number += 1
end

puts 'Seeding complete!'




# bulbs = [
#   ['Incandescent', 'Screw', 'https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcTPo2aFELgiaJwN2sJA3Lez7ElffrJ0qa5ApGvFXVkhxJDtxcqPUgEYNA-YMyiFpeb3XT_yAmwT--hIt6vlI-NdEc7J0t7pfwdCrIkoQt6SOAMofZV318bg3A&usqp=CAE'],
#   ['Incandescent', 'Bayonet', 'https://cdn.shopify.com/s/files/1/0023/3822/6228/products/GLS_Clear_BC_800x.jpg?v=1579789654'],
#   ['CFL', 'Screw', 'https://www.wilko.com/assets/bWFzdGVyfGltYWdlc3wzNTEzNXxpbWFnZS9qcGVnfGltYWdlcy9oZjMvaDE2Lzg4MjM5NjM2MTUyNjIuanBnfDA2ZTBjMGM0YzY2YThjYWJlN2Y3MjZiN2Q0YTc1NDJkNDQ2MjgyNTkzNjI5NWYyZmQzYzhiOGMwMWFlMjBlODA=/0434237-1.jpg'],
#   ['CFL', 'Bayonet', 'https://www.energysavingonline.co.uk/image/cache/catalog/products/20w100wBayonetLowEnergyLightBulbWarmWhiteQuickStart-500x500.jpg'],
#   ['LED', 'Screw', 'https://www.protrade.co.uk/wp-content/uploads/76171-maxitek-8w-bulb.jpg'],
#   ['LED', 'Bayonet', 'https://www.litecraft.co.uk/media/mf_webp/jpg/media/catalog/product/cache/234ba541f4b85f04d81b3d58c0d653b4/s/9/s91-4324_-_10_watt_b22_bayonet_cap_gls_led_light_bulb_-_cool_white.webp'],
#   ['Halogen', 'Other', 'https://cdn.images.fecom-media.com/HE1549510_160981-P.jpg?width=348&height=348&scale=UpscaleCanvas&anchor=MiddleCenter']
# ]

# brands = ['Philips', 'Ledvance', 'Radium', 'Duracell']
# brightness = [450, 800, 1100, 1600, 2600]


# puts 'Creating 20 fake lightbulbs...'

# Lightbulb.destroy_all
# Shop.destroy_all

# 15.times do
#   lightbulb = Lightbulb.create(
#     bulb_type: bulbs[index][0],
#     brand: brands.sample,
#     fitting: bulbs[index][1],
#     brightness: brightness.sample,
#     image: bulbs[index][2]
#     )
#   if index == 6
#     index = 0
#   else
#     index += 1
#   end
# end



# def validate(variable)
#   return variable != nil && variable.length > 2
# end

# def bandq_lightbulb_scrape(url, fitting)
#   lumens_regex = /\d*lm/i
#   bulb_type_regex = /\b(led|gls|incandescent|clf|halogen)\b/i
#   price_regex = /£\d{1,2}|\.\d{1,2}/i

#   file = URI.open(url)
#   doc = Nokogiri::HTML(file)
#   results = doc.search('li')

#   results.each do |element|
#     url_search = element.search("a").attribute("href")
#     img_search = element.search("img").attribute("src")
#     if img_search
#       image = img_search.value
#     end
#     if url_search
#       url = "https://www.diy.com/#{url_search.value}"
#     end
#     price = element.text.scan(price_regex).first.to_s
#     brightness = element.text.scan(lumens_regex).first.to_s
#     bulb_type = element.text.scan(bulb_type_regex).flatten[0]

#     if validate(bulb_type) && validate(brightness) && validate(price) && validate(image) && validate(url)
#       Lightbulb.create(
#         bulb_type: bulb_type,
#         brand: "B&Q",
#         fitting: fitting,
#         brightness: brightness,
#         price: price,
#         image: image,
#         url: url
#       )
#     else
#       puts "Invalid data"
#     end
#   end
# end

# bandq_lightbulb_scrape('https://www.diy.com/departments/lighting/light-bulbs/DIY780138.cat?Cap+fitting+code=B22', 'Bayonet')
# bandq_lightbulb_scrape('https://www.diy.com/departments/lighting/light-bulbs/DIY780138.cat?Cap+fitting+code=E27', 'Screw')
# bandq_lightbulb_scrape('https://www.diy.com/departments/lighting/light-bulbs/DIY780138.cat?Cap+fitting+code=GU10', 'Other')

# puts 'Seeding complete!'
