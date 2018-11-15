# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Clearing database"
User.destroy_all
Event.destroy_all
puts "Cleared"

puts "Seeding...."
test1 = User.new(first_name: "test", last_name:"test", email:"test@test.com", password:"test123", event_organiser: false, professional: true, service:"Chef", bio:"Experienced Chef")
test1.save!
john = User.new(first_name: "John", last_name:"Doe", email:"johndoe@gmail.com", password:"password", event_organiser: false, professional: true, service:"Chef", bio:"Experienced Chef")
john.save!
andrew = User.new(first_name: "Andrew", last_name:"Smith", email:"andrewsmith@gmail.com", password:"password", event_organiser: true, professional: false, bio:"Looking for chef")
andrew.save!
event = Event.new(name:"Birthday Party", date:"2018/12/18", event_type: "birthday", location:"London", description:"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus porta convallis erat, in placerat eros mattis id. Cras lectus sem, mollis sed libero nec, sagittis facilisis purus. Etiam tempus aliquam nisi ut accumsan. Quisque dictum varius magna a posuere. Suspendisse ullamcorper justo orci, sit amet suscipit ligula malesuada eu. Praesent in lorem sed odio tempor pretium eu sit amet justo", party_size: 3, service:"Chef", min_price: 30, max_price: 50, user_id: andrew.id)
event2 = Event.new(name:"Leaving Do", date:"2019/01/19", event_type: "party", location:"Manchester", description:"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus porta convallis erat, in placerat eros mattis id. Cras lectus sem, mollis sed libero nec, sagittis facilisis purus. Etiam tempus aliquam nisi ut accumsan. Quisque dictum varius magna a posuere. Suspendisse ullamcorper justo orci, sit amet suscipit ligula malesuada eu. Praesent in lorem sed odio tempor pretium eu sit amet justo", party_size: 10, service:"Chef", min_price: 30, max_price: 50, user_id: andrew.id)
event3 = Event.new(name:"Casual Dinner", date:"2018/10/19", event_type: "dinner", location:"Bath", description:"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus porta convallis erat, in placerat eros mattis id. Cras lectus sem, mollis sed libero nec, sagittis facilisis purus. Etiam tempus aliquam nisi ut accumsan. Quisque dictum varius magna a posuere. Suspendisse ullamcorper justo orci, sit amet suscipit ligula malesuada eu. Praesent in lorem sed odio tempor pretium eu sit amet justo", party_size: 10, service:"Chef", min_price: 30, max_price: 50, user_id: andrew.id)
event.save!
event2.save!
event3.save!

bid = Bid.new(user_id: john.id, event_id: event.id, price: 5, description: "Really want to do this event")
bid.save!
puts "Seeded"
