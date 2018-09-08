# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Admin.create!(email: "admin@email.com", password: "adminpassword")

User.create!(name:"お試し花子", email: "user@email.com", password: "userpassword")

Genre.create!(name:"イベント")
Genre.create!(name:"映画")
Genre.create!(name:"恋愛")
Genre.create!(name:"日記")
Genre.create!(name:"旅行")
Genre.create!(name:"アニメ")
Genre.create!(name:"ゲーム")
Genre.create!(name:"ニュース")
Genre.create!(name:"料理")
Genre.create!(name:"その他")