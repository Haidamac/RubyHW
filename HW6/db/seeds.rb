author1 = Author.create({ name: Faker::ProgrammingLanguage.creator })
author2 = Author.create({ name: Faker::Book.author })
author3 = Author.create({ name: Faker::Movies::StarWars.character })

articles = 5.times do
  Article.create({ title: Faker::ProgrammingLanguage.name, body: Faker::Quote.matz })
end

author_articles = 4.times do
  Article.create({ title: Faker::Movies::StarWars.wookiee_sentence, body: Faker::Movies::StarWars.quote })
end

comment = 5.times do
  Comment.create({ body: Faker::Quote.jack_handey, author_id: 3, article_id: 2 })
end

comment = 3.times do
  Comment.create({ body: Faker::Quote.jack_handey, author_id: 1, article_id: 3 })
end

comment = 4.times do
  Comment.create({ body: Faker::Quote.jack_handey, author_id: 2, article_id: 1 })
end

comment = 3.times do
  Comment.create({ body: Faker::Quote.yoda, author_id: 1, article_id: 4 })
end

comment = 5.times do
  Comment.create({ body: Faker::Quote.yoda, author_id: 2, article_id: 5 })
end
