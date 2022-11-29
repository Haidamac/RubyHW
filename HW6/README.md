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
![hw6_get](https://user-images.githubusercontent.com/113309864/204479150-e76df064-a45d-4b95-9e17-72d8df568798.png)

### GET published comments only
![hw6_get_published](https://user-images.githubusercontent.com/113309864/204493236-cbd41f53-4cb3-43df-9df4-d5f2f179863f.png)

### POST comment
![hw6_post](https://user-images.githubusercontent.com/113309864/204479309-142bb0a6-9704-47ac-b01a-f6412f406768.png)

### POST comment with missing author
![hw6_post_missing_author](https://user-images.githubusercontent.com/113309864/204479402-856f5eac-4509-465b-a303-71ac829dee54.png)

### Change comment status
![hw6_patch](https://user-images.githubusercontent.com/113309864/204479534-e5b81925-47d3-43c7-804f-8b1d332d8390.png)

### Delete comment
![hw6_delete](https://user-images.githubusercontent.com/113309864/204479661-5ae11191-7bb5-4da2-8812-4c51a83ed52c.png)


