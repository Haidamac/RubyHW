authors = 5.times do
  Author.create({ name: Faker::ProgrammingLanguage.creator })
end

articles1 = 5.times do
  Article.create({ title: Faker::ProgrammingLanguage.name, body:  Faker::Quote.matz, author_id: authors.id })
end

articles2 = 5.times do
  Article.create({ title: Faker::ProgrammingLanguage.name, body:  Faker::Quote.matz, author_id: authors.id })
end

articles3 = 5.times do
  Article.create({ title: Faker::ProgrammingLanguage.name, body:  Faker::Quote.matz, author_id: authors.id })
end

articles4 = 5.times do
  Article.create({ title: Faker::ProgrammingLanguage.name, body:  Faker::Quote.matz, author_id: author.id })
end


comment = 5.times do
  Comment.create({ body: Faker::Quote.jack_handey, author_id: authors.id, article_id: articles1.id })
end

comment = 3.times do
  Comment.create({ body: Faker::Quote.jack_handey, author_id: authors.id, article_id: articles2.id })
end

comment = 4.times do
  Comment.create({ body: Faker::Quote.jack_handey, author_id: authors.id, article_id: articles4.id })
end

comment = 3.times do
  Comment.create({ body: Faker::Quote.yoda, author_id: authors.id, article_id: articles3.id })
end

comment = 5.times do
  Comment.create({ body: Faker::Quote.yoda, author_id: authors.id, article_id: articles3.id })
end

