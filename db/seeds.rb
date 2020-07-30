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

devUser = User.create(username: "dev", email: "dev9999@gmail.com", password: "develop9999")
devUser2 = User.create(username: "Daniel", email: "daniel@gmail.com", password: "daniel")

birthday1 = Birthday.create(giftee_name: "Kermit", dob: Date.new(2019,9,30), user: devUser )
birthday2 = Birthday.create(giftee_name: "Hermit", dob: Date.new(2019,9,14),  user: devUser)
birthday3 = Birthday.create(giftee_name: "Jeff", dob: Date.new(1990,12,12), user: devUser)
birthday4 = Birthday.create(giftee_name: "Michelle", dob: Date.new(2000,4,4), user: devUser2)
birthday5 = Birthday.create(giftee_name: "Ham", dob: Date.new(2000,9,1), user: devUser)
birthday6 = Birthday.create(giftee_name: "Shawn", dob: Date.new(2000,4,4), user: devUser2)
birthday7 = Birthday.create(giftee_name: "Amy", dob: Date.new(2000,9,1), user: devUser)


birthday1.image.attach(io: File.open('app/assets/images/bday1.gif'), filename: 'bday1.gif', content_type: 'image/png/gif')
birthday2.image.attach(io: File.open('app/assets/images/bday2.gif'), filename: 'bday2.gif', content_type: 'image/png/gif')
birthday3.image.attach(io: File.open('app/assets/images/bday3.gif'), filename: 'bday3.gif', content_type: 'image/png/gif')
birthday4.image.attach(io: File.open('app/assets/images/bday4.gif'), filename: 'bday4.gif', content_type: 'image/png/gif')
birthday5.image.attach(io: File.open('app/assets/images/bday5.gif'), filename: 'bday5.gif', content_type: 'image/png/gif')
birthday6.image.attach(io: File.open('app/assets/images/bday6.gif'), filename: 'bday6.gif', content_type: 'image/png/gif')
birthday7.image.attach(io: File.open('app/assets/images/bday7.gif'), filename: 'bday7.gif', content_type: 'image/png/gif')


Reminder.create(birthday: birthday1, message: "Kermit the Frog is a Muppet character created and originally performed by Jim Henson. Introduced in 1955, Kermit serves as the straight man protagonist of numerous Muppet productions, most notably Sesame Street and The Muppet Show.")
Reminder.create(birthday: birthday2, message: "Hermit, the guy from Kermit's house party. Think of better gift ideas!")
Reminder.create(birthday: birthday3, message: "Jeff's Birthday Reminder! Think of better gift ideas!")
Reminder.create(birthday: birthday4, message: "Michelle's bday!!! don't forget!")
Reminder.create(birthday: birthday5, message: "Ham! SPAM! YUMMY!")
Reminder.create(birthday: birthday6, message: "Shawn's bday!!! don't forget! The guy from Michelle's party.")
Reminder.create(birthday: birthday7, message: "Amy's birthday not very important but I should reach out to her.")

Gift.create(giftidea: "tie", price: 20, birthday: Birthday.all.sample)
Gift.create(giftidea: "keyboard", price: 30, birthday: Birthday.all.sample)
Gift.create(giftidea: "earphones", price: 25, birthday: Birthday.all.sample)
Gift.create(giftidea: "dozen red rose", price: 45, birthday: Birthday.all.sample)
Gift.create(giftidea: "ipad", price: 900, birthday: Birthday.all.sample)
Gift.create(giftidea: "notebook", price: 20, birthday: Birthday.all.sample)
Gift.create(giftidea: "watch", price: 1000, birthday: Birthday.all.sample)
Gift.create(giftidea: "Mac book air", price: 1000, birthday: Birthday.all.sample)
 

puts "seed successful"