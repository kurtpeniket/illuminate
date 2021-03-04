# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

types = ['Halogen', 'LED', 'CFL', 'Incandescent']
brands = ['Philips', 'Ledvance', 'Radium', 'Duracell']
fittings = ['Bayonet', 'Screw', 'Other']
brightness = [450, 800, 1100, 1600, 2600]
shops_details = [
  ['B&Q', '88 Church Road, London, UK'],
  ['Homebase', '471 Station Road, London, UK'],
  ['Argos', '387 Queens Road, London, UK'],
  ['Screwfix', '91 High Street, London, UK']
]
number = 0


puts 'Creating 20 fake lightbulbs...'

Lightbulb.destroy_all
Shop.destroy_all

15.times do
  lightbulb = Lightbulb.create(
    bulb_type: types.sample,
    brand: brands.sample,
    fitting: fittings.sample,
    brightness: brightness.sample,
    image: "https://static.bltdirect.com/cache/images/42-Watt-60-Watt-Alternative-Energy-Saving-Halogen-Golfball-ES-700x625.jpg",
    )
  end

4.times do
  shop = Shop.create(
    name: shops_details[number][0],
    address: shops_details[number][1]
  )
  number += 1
end

puts 'Seeding complete'
