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
GiftBirthday.destroy_all
Birthday.destroy_all

devUser = User.create(username: "test", email: "test@gmail.com", password: "develop9999")


reminder1 = Reminder.create(title: "Default Weekly", startdate: 1.day.from_now, frequency: "Weekly")
reminder2 = Reminder.create(title: "Default Monthly", startdate: 1.day.from_now, frequency: "Monthly")
reminder3 = Reminder.create(title: "Default Bi-weekly", startdate: 1.day.from_now, frequency: "Bi-weekly")
reminder4 = Reminder.create(title: "Default 2 Days before", startdate: 1.day.from_now, frequency: "2 days before")


birthday1 = Birthday.create(giftee_name: "Kermit", dob: Date.today, message: "Love you kermit!", email: "k.frog@gmail.com", image_url: "https://vignette.wikia.nocookie.net/muppet/images/7/79/Kermit-the-frog.jpg/revision/latest/scale-to-width-down/340?cb=20101015153557", user: devUser, reminder: nil )
birthday2 = Birthday.create(giftee_name: "Hermit", dob: Date.today, message: "Love you kermit!", email: "k.frog@gmail.com", image_url: "https://vignette.wikia.nocookie.net/muppet/images/7/79/Kermit-the-frog.jpg/revision/latest/scale-to-width-down/340?cb=20101015153557", user: devUser, reminder: nil )
birthday3 = Birthday.create(giftee_name: "Jeff", dob: Date.today, message: "Love you kermit!", email: "k.frog@gmail.com", image_url: "https://vignette.wikia.nocookie.net/muppet/images/7/79/Kermit-the-frog.jpg/revision/latest/scale-to-width-down/340?cb=20101015153557", user: devUser, reminder: reminder3)
birthday4 = Birthday.create(giftee_name: "Greg", dob: Date.today, message: "Love you kermit!", email: "k.frog@gmail.com", image_url: "https://vignette.wikia.nocookie.net/muppet/images/7/79/Kermit-the-frog.jpg/revision/latest/scale-to-width-down/340?cb=20101015153557", user: devUser, reminder: reminder4)
birthday5 = Birthday.create(giftee_name: "Ham", dob: Date.today, message: "Love you kermit!", email: "k.frog@gmail.com", image_url: "https://vignette.wikia.nocookie.net/muppet/images/7/79/Kermit-the-frog.jpg/revision/latest/scale-to-width-down/340?cb=20101015153557", user: devUser, reminder: reminder5)

 Gift.create(giftidea: "tie", price: 20)
 Gift.create(giftidea: "keyboard", price: 30)
 Gift.create(giftidea: "earphones", price: 25)
 Gift.create(giftidea: "dozen red rose", price: 35)
 Gift.create(giftidea: "ipad", price: 1000)

10.times do 
    GiftBirthday.create(birthday_id: Birthday.all.sample.id, gift_id: Gift.all.sample.id)
end

puts "seed successful"