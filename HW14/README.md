# README

## How to use

Install Node.js:
```ruby
sudo apt-get install nodejs
````

Install libvips:
- for UNIX-like systems check your package manager
- for macOS or Windows systems see instruction here https://www.libvips.org/install.html

```ruby
sudo apt install imagemagick libvips
```

Install Redis server:
```ruby
sudo apt install redis-server
```

Type in console:

```ruby
git clone https://github.com/Haidamac/RubyHW.git
```

```ruby
cd RubyHW/HW14
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

You can attach images for products (to complete seed information) in admin panel (Products - Edit) from next sources:

id 1 https://winetime.com.ua/uploads/public/goods/2940/1581953191_49059_502_378.webp

id 2 https://winetime.com.ua/uploads/public/goods/1575/1509805203_49532_502_378.webp

id 3 https://winetime.com.ua/uploads/public/goods/16125/52233305134_30e5058d3c_b_502_378.webp

id 4 https://winetime.com.ua/uploads/public/goods/3538/1536585859_75684_502_378.webp

id 5 https://winetime.com.ua/uploads/public/goods/275/52419864226_f0b7f969d3_b_502_378.webp

id 6 https://winetime.com.ua/uploads/public/goods/2943/1525691794_49474_502_378.webp

id 7 https://winetime.com.ua/uploads/public/goods/2959/51237484431_4a44462f11_b_502_378.webp

id 8 https://winetime.com.ua/uploads/public/goods/15356/51782414651_39e48be274_b_502_378.webp

id 9 https://winetime.com.ua/uploads/public/goods/14353/51478552508_93e952c6fc_b_502_378.webp

id 10 https://winetime.com.ua/uploads/public/goods/11358/51171780096_563d090b48_b_502_378.webp

id 11 https://winetime.com.ua/uploads/public/goods/15961/52130241702_f825547d9a_b_502_378.webp

id 12 https://winetime.com.ua/uploads/public/goods/6462/1383317069_5664_502_378.webp

id 13 https://winetime.com.ua/uploads/public/goods/6905/1441103025_55335_502_378.webp

id 14 https://winetime.com.ua/uploads/public/goods/15337/51781796161_d588de57e9_b_502_378.webp

id 15 https://winetime.com.ua/uploads/public/goods/13807/51205616107_daf643dd53_b_502_378.webp

or attach your own images
