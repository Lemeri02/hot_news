# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



user = User.create(login: 'Jhon')
article = Article.create(title: 'В Калуге обнаружены Бобры', body: 'Бобры добры')
video = Video.create(title: 'Видео про бобров', video_url: 'https://www.youtube.com/watch?v=uq1vIwUjowc')

continent  = Location.create(name: 'Евразия')
country = Location.create(name: 'Россия', attachment: continent)
region = Location.create(name: 'ЦФО', attachment: country)
district = Location.create(name: 'Калужская область', attachment: region)
city = Location.create(name: 'Калуга', article: article, attachment: district)


comment = Comment.create(user: user, commentable: article, body: 'Бобры комментируют')
comment2 = Comment.create(user: user, commentable: video, body: 'Коммент под бобровский видос')
