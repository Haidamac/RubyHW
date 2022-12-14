10.times do
  Tag.create({ tagname: Faker::ProgrammingLanguage.name })
end

3.times do
  author = Author.create({ name: Faker::ProgrammingLanguage.creator })
  2.times do
    article = Article.create({ title: Faker::ProgrammingLanguage.name, body:  Faker::Quote.matz, author_id: author.id, tag_ids: [1, 2, 5] })
    15.times do
      Comment.create({ body: Faker::Quote.jack_handey, author_id: author.id, article_id: article.id })
    end
  end
end

5.times do
  author = Author.create({ name: Faker::ProgrammingLanguage.creator })
  3.times do
    article = Article.create({ title: Faker::ProgrammingLanguage.name, body:  Faker::Quote.matz, author_id: author.id, tag_ids: [1, 5, 8] })
    20.times do
      Comment.create({ body: Faker::Quote.jack_handey, author_id: author.id, article_id: article.id })
    end
  end
end

7.times do
  author = Author.create({ name: Faker::ProgrammingLanguage.creator })
  5.times do
    article = Article.create({ title: Faker::ProgrammingLanguage.name, body:  Faker::Quote.matz, author_id: author.id, tag_ids: [3, 9] })
    18.times do
      Comment.create({ body: Faker::Quote.jack_handey, author_id: author.id, article_id: article.id })
    end
  end
end

3.times do
  author = Author.create({ name: Faker::ProgrammingLanguage.creator })
  8.times do
    article = Article.create({ title: Faker::ProgrammingLanguage.name, body:  Faker::Quote.matz, author_id: author.id, tag_ids: [4, 5] })
    25.times do
      Comment.create({ body: Faker::Quote.jack_handey, author_id: author.id, article_id: article.id })
    end
  end
end

2.times do
  author = Author.create({ name: Faker::ProgrammingLanguage.creator })
  3.times do
    article = Article.create({ title: Faker::ProgrammingLanguage.name, body:  Faker::Quote.matz, author_id: author.id, tag_ids: [3, 5] })
    15.times do
      Comment.create({ body: Faker::Quote.jack_handey, author_id: author.id, article_id: article.id })
    end
  end
end
