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
    image: "https://content2.rozetka.com.ua/goods/images/big/10681099.jpg",
    price: 14.88,
    category_id: 1)
Product.create(name: 'Jack Daniel\'s Old No.7',
    description: 'Tennessee Sour Mash Whiskey Jack Daniel\'s Old No.7 0.7l 40%',
    image: "https://content.rozetka.com.ua/goods/images/big/10695806.jpg",
    price: 18.99,
    category_id: 2)
Product.create(name: 'Jim Beam White',
    description: 'Kentucky Straight Bourbon Whiskey Jim Beam White 0.7l 40%',
    image: "https://content1.rozetka.com.ua/goods/images/big/10779807.jpg",
    price: 15.59,
    category_id: 2)
Product.create(name: 'Rocca Rossa Prosecco',
    description: 'Rocca Rossa Prosecco Extra Dry 0.75l 11% wine',
    image: "https://content.rozetka.com.ua/goods/images/big/16634123.jpg",
    price: 8.99,
    category_id: 4)
Product.create(name: 'Latinium Sparkling Breeze',
    description: 'Latinium Sparkling Breeze White Semidry 0.75l 8.5% wine',
    image: "https://content1.rozetka.com.ua/goods/images/big/11996090.jpg",
    price: 4.29,
    category_id: 4)
Product.create(name: 'Martini Asti',
    description: 'Martini Asti White Sweet 0.75l 7.5% wine',
    image: "https://content.rozetka.com.ua/goods/images/big/10692096.jpg",
    price: 9.19,
    category_id: 4)
Product.create(name: 'Browar Beer',
    description: 'Browar Beer 12x0.35l',
    image: "https://content.rozetka.com.ua/goods/images/big/302605668.jpg",
    price: 15.99,
    category_id: 3)
Product.create(name: 'Whitley Neill Sloe Gin',
    description: 'Whitley Neill Sloe Gin 0.7l 28%',
    image: "https://content1.rozetka.com.ua/goods/images/big/241694721.jpg",
    price: 20.79,
    category_id: 1)
Product.create(name: 'Berkshire Botanical Gin',
    description: 'Berkshire Botanical Dandelion & Burdock Gin 0.5l 40.3%',
    image: "https://content1.rozetka.com.ua/goods/images/big/297366583.jpg",
    price: 19.99,
    category_id: 1)
Product.create(name: 'The Pogues',
    description: 'The Pogues Irish Whiskey 1l 40%',
    image: "https://content2.rozetka.com.ua/goods/images/big/20787934.jpg",
    price: 31.19,
    category_id: 2)
Product.create(name: 'Tanqueray',
    description: 'Tanqueray London Dry Gin 0.7l 47.3%',
    image: "https://content2.rozetka.com.ua/goods/images/big/303153953.jpg",
    price: 13.59,
    category_id: 1)
Product.create(name: 'Finsbury Platinum',
    description: 'Finsbury Platinum Gin 0.7l 47%',
    image: "https://content.rozetka.com.ua/goods/images/big/44445975.jpg",
    price: 16.59,
    category_id: 1)
Product.create(name: 'Glenmorangie Nectar',
    description: 'Glenmorangie Nectar Whiskey d\'Or 0.7 л 46%',
    image: "https://content1.rozetka.com.ua/goods/images/big/10681829.jpg",
    price: 59.99,
    category_id: 2)
Product.create(name: 'Paulaner Weissbier',
    description: 'Paulaner Weissbier 5.5% 20x0.5l',
    image: "https://content2.rozetka.com.ua/goods/images/big/10732550.jpg",
    price: 42.79,
    category_id: 3)
Product.create(name: 'Hayman\'s Royal Dock Gin',
    description: 'Hayman\'s Royal Dock Gin 0.7l 57%',
    image: "https://content1.rozetka.com.ua/goods/images/big/17606159.jpg",
    price: 19.99,
    category_id: 1)

User.create!(email: 'user@example.com', password: 'qwerty', password_confirmation: 'qwerty')
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?