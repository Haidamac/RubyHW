# README

## How to use
Type in console:

```ruby
git clone https://github.com/alinajuly/RubyHW.git
```

```ruby
cd RubyHW/HW6
````

```ruby
gem install bundler
```
```ruby
bundle install
```

Attach ```config/database.yml``` with changes in database name

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

## Tests in Postman

### GET article with comments
![](/home/haidamac/Pictures/hw6_get.png)

### POST comment
![](/home/haidamac/Pictures/hw6_post.png)

### POST comment with missing author
![](/home/haidamac/Pictures/hw6_post_missing_author.png)

### Change comment status
![](/home/haidamac/Pictures/hw6_patch.png)

### Delete comment
![](/home/haidamac/Pictures/hw6_delete.png)


