# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

20.times do
  Cat.create(
    birth_date: Faker::Date.between(from: '2014-09-23', to: '2014-09-25'),
    color: Faker::Color.color_name,
    name: Faker::Name.name,
    sex: (["M", "F", "RASCAL", "NB"]).sample,
    description: Faker::Quote.most_interesting_man_in_the_world
  )
end