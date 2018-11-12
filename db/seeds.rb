# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
john = User.new(fist_name: "John", last_name:"Doe", email:"johndoe@gmail.com", password:"password", event_organiser: false, service:"Chef", bio:"Experienced Chef")
john.save
andrew = User.new(fist_name: "Andrew", last_name:"Smith", email:"andrewsmith@gmail.com", password:"password", event_organiser: true, bio:"Looking for chef")
andrew.save
event = Event.new(name:"Birthday Dinner", date:"13th of november", type:"Dinner", location:"138 kingsland road", description:"Small dinner party", party_size: 3, service:"Chef", min_price: 30, max_price: 50, user_id: andrew.id)
event.save
Bid.create(user_id: john.id, event_id: event.id, price: 5, description: "Really want to do this event")
