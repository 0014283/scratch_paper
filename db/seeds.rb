# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Admin.create!(email: "admin@email.com", password: "adminpassword")

User.create!(name:"お試し花子", email: "000@000", password: "123456")
User.create!(name:"お試し太郎", email: "111@111", password: "123456")
User.create!(name:"煌き花子", email: "222@222", password: "123456")
User.create!(name:"煌き太郎", email: "333@333", password: "123456")
User.create!(name:"昨日の花子", email: "444@444", password: "123456")
User.create!(name:"昨日の太郎", email: "555@555", password: "123456")
User.create!(name:"明日の花子", email: "666@666", password: "123456")
User.create!(name:"明日の太郎", email: "777@777", password: "123456")

Genre.create!(name:"イベント")
Genre.create!(name:"映画")
Genre.create!(name:"恋愛")
Genre.create!(name:"日記")
Genre.create!(name:"読書")
Genre.create!(name:"旅行")
Genre.create!(name:"アニメ")
Genre.create!(name:"ゲーム")
Genre.create!(name:"音楽")
Genre.create!(name:"ニュース")
Genre.create!(name:"料理")
Genre.create!(name:"その他")

Paper.create!(title:"快晴", content: "大雨", user_id: 1, start_date: '2018-9-14', end_date: '2018-9-20', genre_id: 1)
Paper.create!(title:"大雨", content: "快晴", user_id: 2, start_date: '2018-9-16', end_date: '2018-9-18', genre_id: 7)
Paper.create!(title:"今日はいい天気でした", content: "見渡す限り雲ひとつない快晴でとても気持ちがよかったです", user_id: 3, start_date: '2018-9-17', end_date: '2018-9-17', genre_id: 3)
Paper.create!(title:"すごい雨！！", content: "今日は平成に入って歴史的な大雨みたいです。大丈夫かな", user_id: 4, start_date: '2018-9-21', genre_id: 4)
Paper.create!(title:"大発見でした！", content: "実はこんなこともできたんですね。詳細はまた投稿します！", user_id: 5, end_date: '2018-9-22', genre_id: 5)
Paper.create!(title:"ありがとう", content: "いつも当たり前に思っていることも実はとてもありがたいことかもしれません。感謝の気持ちを忘れずに", user_id: 6, start_date: '2018-9-21', end_date: '2018-9-22', genre_id: 6)
Paper.create!(title:"今日はスーパーヒーローみたよ！", content: "今年見た映画で一番よかったかもしれない！！", user_id: 7, start_date: '2018-9-22', end_date: '2018-9-26', genre_id: 2)
Paper.create!(title:"最近映画見てないなー", content: "なんか面白いことないかな", user_id: 8, start_date: '2018-9-24', end_date: '2018-9-28', genre_id: 8)
Paper.create!(title:"AquaTimez", content: "最近またブームきてる！最高！引退やだなあ", user_id: 8, genre_id: 9)
Paper.create!(title:"集団通り魔", content: "最近話題になってる。夜道は特に気をつけないと、、", user_id: 8, genre_id: 10)
Paper.create!(content: "今日は炒飯作った！ンンンンまずいい！笑", user_id: 8, genre_id: 11)
Paper.create!(content: "試しに投稿して見よーっと！", user_id: 8, genre_id: 12)
