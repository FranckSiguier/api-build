# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Destroying database'

User.destroy_all
Restaurant.destroy_all
Comment.destroy_all

puts 'Creating new seeds'

mat = User.create!(email:'test@test.com', password:'123456')
franck = User.create!(email:'test1@test.com', password:'123456')

rest1 = Restaurant.create!(name:'le beau cochon', address:'78 rue sully', user_id: mat.id)
rest2 = Restaurant.create!(name:'le bon cochon', address:'27 rue sala', user_id: mat.id)

comment1 = Comment.create!(user_id: franck.id, restaurant_id: rest1.id, content:"C'est vraiment très bon")
comment1 = Comment.create!(user_id: franck.id, restaurant_id: rest2.id, content:"C'est vraiment très bon ici aussi")
