# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Cleaning database.."

Flat.destroy_all

puts "Creating new flats.."

5.times do
  new_flat = Flat.new(
    name: Faker::Address.city,
    address: Faker::Address.street_address,
    description: Faker::ChuckNorris.fact,
    price_per_night: [200, 340, 543, 232.2, 120, 129.90].sample,
    number_of_guests: [1, 2, 3, 4, 5, 6, 7].sample
  )

  new_flat.save

  puts "#{new_flat.id} - #{new_flat.name} was created"
end
