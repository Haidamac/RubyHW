15.times do
  author = Author.create({ name: Faker::ProgrammingLanguage.creator })
  3.times do
    article = Article.create({ title: Faker::ProgrammingLanguage.name, body:  Faker::Quote.matz, author_id: author.id })
    5.times do
      Comment.create({ body: Faker::Quote.jack_handey, author_id: author.id, article_id: article.id })
    end
  end
end

