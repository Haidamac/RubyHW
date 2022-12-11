authors = 5.times do
  Author.create({ name: Faker::ProgrammingLanguage.creator })
end

tags = 10.times do
  Tag.create({ tagname: Faker::ProgrammingLanguage.name })
end

articles1 = 5.times do
  Article.create({ title: Faker::ProgrammingLanguage.name, body:  Faker::Quote.matz, tag_ids: [1, 4, 7], author_id: 1 })
end

articles2 = 5.times do
  Article.create({ title: Faker::ProgrammingLanguage.name, body:  Faker::Quote.matz, tag_ids: [2, 5, 8], author_id: 2 })
end

articles3 = 5.times do
  Article.create({ title: Faker::ProgrammingLanguage.name, body:  Faker::Quote.matz, tag_ids: [3, 9], author_id: 3 })
end

articles4 = 5.times do
  Article.create({ title: Faker::ProgrammingLanguage.name, body:  Faker::Quote.matz, tag_ids: [1, 5], author_id: 4 })
end


comment = 5.times do
  Comment.create({ body: Faker::Quote.jack_handey, author_id: 3, article_id: 1 })
end

comment = 3.times do
  Comment.create({ body: Faker::Quote.jack_handey, author_id: 1, article_id: 3 })
end

comment = 4.times do
  Comment.create({ body: Faker::Quote.jack_handey, author_id: 2, article_id: 5 })
end

comment = 3.times do
  Comment.create({ body: Faker::Quote.yoda, author_id: 4, article_id: 7 })
end

comment = 5.times do
  Comment.create({ body: Faker::Quote.yoda, author_id: 5, article_id: 2 })
end
