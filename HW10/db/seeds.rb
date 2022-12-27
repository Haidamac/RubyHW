# Product.destroy_all
# Category.destroy_all
# User.destroy_all
# AdminUser.destroy_all

Category.create(title: 'Gin')
Category.create(title: 'Whiskey')
Category.create(title: 'Beer')
Category.create(title: 'Wine')

Product.create(name: 'Gordon\'s',
    description: 'Gin Gordon\'s 1l 37.5% London Dry',
    image: "https://winetime.com.ua/uploads/public/goods/2940/1581953191_49059_502_378.webp",
    price: 14.88,
    category_id: 1)
Product.create(name: 'Jack Daniel\'s Old No.7',
    description: 'Tennessee Sour Mash Whiskey Jack Daniel\'s Old No.7 0.7l 40%',
    image: "https://winetime.com.ua/uploads/public/goods/1575/1509805203_49532_502_378.webp",
    price: 18.99,
    category_id: 2)
Product.create(name: 'Jim Beam White',
    description: 'Kentucky Straight Bourbon Whiskey Jim Beam White 0.7l 40%',
    image: "https://winetime.com.ua/uploads/public/goods/16125/52233305134_30e5058d3c_b_502_378.webp",
    price: 15.59,
    category_id: 2)
Product.create(name: 'Fantinel Prosecco',
    description: 'Fantinel Prosecco Extra Dry 1,5l 11.5% wine',
    image: "https://winetime.com.ua/uploads/public/goods/3538/1536585859_75684_502_378.webp",
    price: 39.19,
    category_id: 4)
Product.create(name: 'Latinium Sparkling Breeze',
    description: 'Latinium Sparkling Breeze White Semidry 0.75l 8.5% wine',
    image: "https://content1.rozetka.com.ua/goods/images/big/11996090.jpg",
    price: 4.29,
    category_id: 4)
Product.create(name: 'Martini Asti',
    description: 'Martini Asti White Sweet 0.75l 7.5% wine',
    image: "https://winetime.com.ua/uploads/public/goods/2943/1525691794_49474_502_378.webp",
    price: 9.19,
    category_id: 4)
Product.create(name: 'Browar Beer',
    description: 'Browar Beer 12x0.35l',
    image: "https://content.rozetka.com.ua/goods/images/big/302605668.jpg",
    price: 15.99,
    category_id: 3)
Product.create(name: 'Whitley Neill Sloe Gin',
    description: 'Whitley Neill Sloe Gin 0.7l 28% Whitley Neill Gin is a handcrafted, premium gin that is inspired by the very best flavours and ingredients from around the world – and distilled in the heart of the City of London. Discover what makes our range of artisanal gins',
    image: "https://winetime.com.ua/uploads/public/goods/15356/51782414651_39e48be274_b_502_378.webp",
    price: 20.79,
    category_id: 1)
Product.create(name: 'Sour Cherry Gin',
    description: 'Luxardo Sour Cherry Gin 0.7l 37.5%',
    image: "https://winetime.com.ua/uploads/public/goods/14353/51478552508_93e952c6fc_b_502_378.webp",
    price: 19.99,
    category_id: 1)
Product.create(name: 'The Pogues',
    description: 'The Pogues Irish Whiskey 1l 40%',
    image: "https://winetime.com.ua/uploads/public/goods/11358/51171780096_563d090b48_b_502_378.webp",
    price: 31.19,
    category_id: 2)
Product.create(name: 'Tanqueray',
    description: 'Tanqueray London Dry Gin 0.7l 47.3%',
    image: "https://winetime.com.ua/uploads/public/goods/15961/52130241702_f825547d9a_b_502_378.webp",
    price: 13.59,
    category_id: 1)
Product.create(name: 'Finsbury Platinum',
    description: 'Finsbury Platinum Gin 0.7l 47%',
    image: "https://winetime.com.ua/uploads/public/goods/6462/1383317069_5664_502_378.webp",
    price: 16.59,
    category_id: 1)
Product.create(name: 'Glenmorangie Nectar',
    description: 'Glenmorangie Nectar Whiskey d\'Or 0.7 л 46%',
    image: "https://winetime.com.ua/uploads/public/goods/6905/1441103025_55335_502_378.webp",
    price: 59.99,
    category_id: 2)
Product.create(name: 'Wieninger Weissbier Hell',
    description: 'Wieninger Weissbier Hell 5.3% 0.5l',
    image: "https://winetime.com.ua/uploads/public/goods/15337/51781796161_d588de57e9_b_502_378.webp",
    price: 42.79,
    category_id: 3)
Product.create(name: 'City of London Old Tom Gin',
    description: 'City of London Distillery Old Tom Gin 0.7l 40.3% City of London Old Tom Gin is a lightly sweetened Old Tom style gin. Bottled at 43% ABV, it features a very traditional list of botanicals. Each batch though is small and tightly controlled— produced a scant 200 bottles at a time.',
    image: "https://winetime.com.ua/uploads/public/goods/13807/51205616107_daf643dd53_b_502_378.webp",
    price: 19.99,
    category_id: 1)

User.create!(email: 'user@example.com', password: 'qwerty', password_confirmation: 'qwerty')
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?