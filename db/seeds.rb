# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# types = ['Halogen', 'LED', 'CFL', 'Incandescent']
# fittings = ['Bayonet', 'Screw', 'Other']
bulbs = [
  ['Incandescent', 'Screw', 'https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcTPo2aFELgiaJwN2sJA3Lez7ElffrJ0qa5ApGvFXVkhxJDtxcqPUgEYNA-YMyiFpeb3XT_yAmwT--hIt6vlI-NdEc7J0t7pfwdCrIkoQt6SOAMofZV318bg3A&usqp=CAE'],
  ['Incandescent', 'Bayonet', 'https://cdn.shopify.com/s/files/1/0023/3822/6228/products/GLS_Clear_BC_800x.jpg?v=1579789654'],
  ['CFL', 'Screw', 'https://www.wilko.com/assets/bWFzdGVyfGltYWdlc3wzNTEzNXxpbWFnZS9qcGVnfGltYWdlcy9oZjMvaDE2Lzg4MjM5NjM2MTUyNjIuanBnfDA2ZTBjMGM0YzY2YThjYWJlN2Y3MjZiN2Q0YTc1NDJkNDQ2MjgyNTkzNjI5NWYyZmQzYzhiOGMwMWFlMjBlODA=/0434237-1.jpg'],
  ['CFL', 'Bayonet', 'https://www.energysavingonline.co.uk/image/cache/catalog/products/20w100wBayonetLowEnergyLightBulbWarmWhiteQuickStart-500x500.jpg'],
  ['LED', 'Screw', 'https://www.protrade.co.uk/wp-content/uploads/76171-maxitek-8w-bulb.jpg'],
  ['LED', 'Bayonet', 'https://www.litecraft.co.uk/media/mf_webp/jpg/media/catalog/product/cache/234ba541f4b85f04d81b3d58c0d653b4/s/9/s91-4324_-_10_watt_b22_bayonet_cap_gls_led_light_bulb_-_cool_white.webp'],
  ['Halogen', 'Other', 'https://cdn.images.fecom-media.com/HE1549510_160981-P.jpg?width=348&height=348&scale=UpscaleCanvas&anchor=MiddleCenter']
]

brands = ['Philips', 'Ledvance', 'Radium', 'Duracell']
brightness = [450, 800, 1100, 1600, 2600]

shops_details = [
  ['B&Q', '88 Church Road, London, UK'],
  ['Homebase', '471 Station Road, London, UK'],
  ['Argos', '387 Queens Road, London, UK'],
  ['Screwfix', '91 High Street, London, UK']
]

index = 0
number = 0


puts 'Creating 20 fake lightbulbs...'

Lightbulb.destroy_all
Shop.destroy_all

15.times do
  lightbulb = Lightbulb.create(
    bulb_type: bulbs[index][0],
    brand: brands.sample,
    fitting: bulbs[index][1],
    brightness: brightness.sample,
    image: bulbs[index][2]
    )
  if index == 6
    index = 0
  else
    index += 1
  end
end


4.times do
  shop = Shop.create(
    name: shops_details[number][0],
    address: shops_details[number][1]
  )
  number += 1
end

puts 'Seeding complete'
