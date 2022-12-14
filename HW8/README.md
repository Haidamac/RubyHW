# README

## How to use
Type in console:

```ruby
git clone https://github.com/Haidamac/RubyHW.git
```

```ruby
cd RubyHW/HW8
````

```ruby
gem install bundler
```
```ruby
bundle install
```

Attach ```config/database.yml``` acording `database copy.yml` with your username and password

Type in console:

```ruby
rails db:create
```

```ruby
rails db:migrate
```

```ruby
rails db:seed
```

```ruby
rails s
```

## How it works

List first 15 articles (method GET):
```ruby
http://127.0.0.1:3000/api/v1/articles
```

List next 15 articles (method GET):
```ruby
http://127.0.0.1:3000/api/v1/articles?page=2
```
etc

List article with ```:id``` (serialization by id, title, body, created_at, author_name), tags and 
comments (serialization by id, body, status, author_name, created_at) (method GET):
```ruby
http://127.0.0.1:3000/api/v1/articles/:id
```

Search articles (method GET):
```ruby
http://127.0.0.1:3000/api/v1/search?q=searching_phrase
```

Filter articles (method GET):
- by status:
```ruby
http://127.0.0.1:3000/api/v1/articles?status=0 (or 1)
```
-by name of author:
```ruby
http://127.0.0.1:3000/api/v1/articles?author=author_name
```
-by tags
```ruby
http://127.0.0.1:3000/api/v1/articles?tags=tag1&tags=tag2
```

Sort articles by title (method GET):
```ruby
http://127.0.0.1:3000/api/v1/order?order=asc
```
or
```ruby
http://127.0.0.1:3000/api/v1/order?order=desc
```

List all tags (method GET):
```ruby
http://127.0.0.1:3000/api/v1/tags
```

List all articles with tag ```:id``` (method GET):
```ruby
http://127.0.0.1:3000/api/v1/tags/:id
```

Post new article (method POST):
```ruby
http://127.0.0.1:3000/api/v1/articles
```

Post new tag (method POST):
```ruby
http://127.0.0.1:3000/api/v1/tags
```

Update the article with ```:id``` (method PATCH):
```ruby
http://127.0.0.1:3000/api/v1/articles/:id?title=change_in_title &body=change_in_body
```

Delete the article with ```:id``` (method DELETE):
```ruby
http://127.0.0.1:3000/api/v1/articles/:id
```

List all comments for article with ```:id``` (method GET):
```ruby
http://127.0.0.1:3000/api/v1/articles/:id/comments
```

List only published comments for article with ```:article_id``` (method GET):
```ruby
http://127.0.0.1:3000/api/v1/articles/:article_id/comments?status=1
```

List only unpublished comments for article with ```:article_id``` (method GET):
```ruby
http://127.0.0.1:3000/api/v1/articles/:article_id/comments?status=0
```

List comment with ```:id``` (method GET):
```ruby
http://127.0.0.1:3000/api/v1/articles/:article_id/comments/:id
```

Change status of comment (with ```:id```) to ```published``` (method PATCH):
```ruby
http://127.0.0.1:3000/api/v1/articles/:article_id/comments/:id?status=published
```

Delete the comment with ```:id``` (method DELETE):
```ruby
http://127.0.0.1:3000/api/v1/articles/:article_id/comments/:id
```

Like the article with ```:article_id``` by user with ```:author_id``` (method POST):
```ruby
http://127.0.0.1:3000/api/v1/articles/:article_id/likes?like[author_id]=:author_id
```

Unlike the article with ```:article_id``` and like's ```:id``` (method DELETE):
```ruby
http://127.0.0.1:3000/api/v1/articles/:article_id/likes/:id
```

Like the comment with ```:comment_id``` by user with ```:author_id``` (method POST):
```ruby
http://127.0.0.1:3000/api/v1/articles/:article_id/comments/:comment_id/likes?like[author_id]=:author_id
```

Unlike the comment with ```:comment_id``` and like's ```:id``` (method DELETE):
```ruby
http://127.0.0.1:3000/api/v1/articles/:article_id/comments/:comment_id/likes/:id
```
