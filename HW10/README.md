# README

## How to use

Install Node.js:
```ruby
sudo apt-get install nodejs
````

Type in console:

```ruby
git clone https://github.com/Haidamac/RubyHW.git
```

```ruby
cd RubyHW/HW10
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

Run online store in browser:
```ruby
http://127.0.0.1:3000/
```
Login with ```user@example.com```, password: ```qwerty```
or SignUp new user

Run admin panel in browser:
```ruby
http://127.0.0.1:3000/admin
```
Login with ```admin@example.com```, password: ```password```
