# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Gift.destroy_all
Reminder.destroy_all
Birthday.destroy_all

devUser = User.create(username: "test", email: "test@gmail.com", password: "develop9999")

birthday1 = Birthday.create(giftee_name: "Kermit", dob: Date.new(2019,7,8), message: "Love you kermit!", email: "k.frog@gmail.com", image_url: "https://vignette.wikia.nocookie.net/muppet/images/7/79/Kermit-the-frog.jpg/revision/latest/scale-to-width-down/340?cb=20101015153557", user: devUser )
birthday2 = Birthday.create(giftee_name: "Hermit", dob: Date.new(2019,7,8), message: "Love you kermit!", email: "k.frog@gmail.com", image_url: "https://vignette.wikia.nocookie.net/muppet/images/7/79/Kermit-the-frog.jpg/revision/latest/scale-to-width-down/340?cb=20101015153557", user: devUser)
birthday3 = Birthday.create(giftee_name: "Jeff", dob: Date.new(1990,2,8), message: "Love you kermit!", email: "k.frog@gmail.com", image_url: "https://vignette.wikia.nocookie.net/muppet/images/7/79/Kermit-the-frog.jpg/revision/latest/scale-to-width-down/340?cb=20101015153557", user: devUser)
birthday4 = Birthday.create(giftee_name: "Greg", dob: Date.new(2000,4,8), message: "Love you kermit!", email: "k.frog@gmail.com", image_url: "https://vignette.wikia.nocookie.net/muppet/images/7/79/Kermit-the-frog.jpg/revision/latest/scale-to-width-down/340?cb=20101015153557", user: devUser)
birthday5 = Birthday.create(giftee_name: "Ham", dob: Date.new(2000,9,9), message: "Love you kermit!", email: "k.frog@gmail.com", image_url: "https://vignette.wikia.nocookie.net/muppet/images/7/79/Kermit-the-frog.jpg/revision/latest/scale-to-width-down/340?cb=20101015153557", user: devUser)

Reminder.create(birthday: birthday1, startdate: 1.day.from_now, frequency: "Weekly")
Reminder.create(birthday: birthday2, startdate: 1.day.from_now, frequency: "Monthly")
Reminder.create(birthday: birthday3, startdate: 1.day.from_now, frequency: "Bi-weekly")
Reminder.create(birthday: birthday4, startdate: 1.day.from_now, frequency: "Weekly")
Reminder.create(birthday: birthday5, startdate: 1.day.from_now, frequency: "Weekly")


 Gift.create(giftidea: "tie", price: 20, birthday: birthday1)
 Gift.create(giftidea: "keyboard", price: 30, birthday: birthday2)
 Gift.create(giftidea: "earphones", price: 25, birthday_id: Birthday.all.sample.id)
 Gift.create(giftidea: "dozen red rose", price: 35, birthday_id: Birthday.all.sample.id)
 Gift.create(giftidea: "ipad", price: 1000, birthday_id: Birthday.all.sample.id)
 Gift.create(giftidea: "notebook", price: 20, birthday_id: Birthday.all.sample.id)
 Gift.create(giftidea: "watch", price: 1000, birthday_id: Birthday.all.sample.id)
 
 
puts "seed successful"