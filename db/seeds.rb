# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
# TODO: Write a seed to insert 100 posts in the database

Treehouse.destroy_all
User.destroy_all

puts 'Creating a fake user...'
10.times do
  User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    description: Faker::Lorem.paragraphs,
    email: Faker::Internet.email,
    phone_number: Faker::PhoneNumber.cell_phone,
    password: "passwords"
    )
end
puts "Completed user #{User.last.first_name}!"

puts 'Creating 20 fake treehouses...'
20.times do
  treehouse = Treehouse.new(
    name: Faker::Address.street_name,
    address: %w[Songsvann Ekeberg Frognerseter Østmarka Ullevålseter Vetterkollen Holmenkollen Frysja Maridalsvannet Kolsåstoppen Bygdøy Nøklevannet].sample,
    description: Faker::Lorem.paragraphs,
    price_per_night: rand(500..2500),
    beds: rand(1..5),
    capacity: rand(1..10)
  )

  treehouse.user = User.all.sample
  treehouse.save
  puts "treehouse: #{treehouse.name}"
  puts "owner: #{treehouse.user.first_name}"
end
puts "Completed treehouses!"






