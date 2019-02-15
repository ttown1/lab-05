# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
for i in 1..50
  name = Faker::Name.name
  email = Faker::Internet.free_email(name)
  user = User.new
  user.name = name
  user.email = email
  if user.save
    for ii in 1..50
      title = Faker::Movies::BackToTheFuture.character
      article = Article.new
      article.user = user
      article.title = title
      article.content = Faker::Lorem.paragraph
      if article.save
        for iii in 1..10
          comment = Comment.new
          comment.user = user
          comment.article = article
          comment.message = Faker::Games::LeagueOfLegends.quote
          comment.save
        end
      end
    end
  end
end
