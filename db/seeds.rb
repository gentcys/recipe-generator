# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do |i|
  User.find_or_create_by!(username: "fakeuser#{i}") do |user|
    user.name = "Fake User #{i}"
    user.email = "fakeuser#{i}@example.com"
    user.password = "password#{i}"
    user.password_confirmation = "password#{i}"
  end
end
