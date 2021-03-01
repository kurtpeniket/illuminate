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


puts 'Creating 20 fake lightbulbs...'

Lightbulb.destroy_all

20.times do
  lightbulb = Lightbulb.create(
    bulb_type: types.sample,
    brand: brands.sample,
    fitting: fittings.sample,
    brightness: brightness.sample,
    image: "https://www.lampwise.co.uk/media/catalog/product/cache/516caa1eff981221ce7fb99c51156f34/p/h/philips_40w_es_e27_gls_clear.jpg",
    url: "https://www.lightbulbs-direct.com/crompton-lamps-60w-gls-b22-dimmable-traffic-signal-warm-white-pearl/"
    )
  end


puts 'Seeding complete'
