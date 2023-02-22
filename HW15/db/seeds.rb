# frozen_string_literal: true

User.create!(email: 'user@example.com', password: 'qwerty', password_confirmation: 'qwerty')
if Rails.env.development?
  AdminUser.create!(email: 'admin@example.com', password: 'password',
                    password_confirmation: 'password')
end

categories = %w[Gin Whiskey Beer Wine]
products = [{ name: 'Gordon\'s London Dry Gin',
              description: 'Gordon\'s London Dry Gin 1l 37.5% Same great award-winning gin as the classic green
              Gordon\'s bottle, different label & bottle to celebrate the first export out of the UK in the early
              1900\'s.',
              price: 14.88, title: 'Gin' },
            { name: 'Jack Daniel\'s Old No.7',
              description: 'Tennessee Sour Mash Whiskey Jack Daniel\'s Old No.7 0.7l 40% Mellowed drop by drop through
              10-feet of sugar maple charcoal, then matured in handcrafted barrels of our own making. And our Tennessee
              Whiskey doesn\'t follow a calendar. It\'s only ready when our tasters say it is.',
              price: 18.99, title: 'Whiskey' },
            { name: 'Jim Beam White',
              description: 'Kentucky Straight Bourbon Whiskey Jim Beam White 0.7l 40% JIM BEAM WHITE derives its rich
              satisfying flavour from a treasured family recipe and a minimum of four years of ageing in new, charred
              oak barrels.',
              price: 15.59, title: 'Whiskey' },
            { name: 'Fantinel Prosecco',
              description: 'Fantinel Prosecco Extra Dry 1,5l 11.5% Once upon a time there was a man with a radiant
              smile who venerated good food so much that it became his reason for living. And in such a joyful parade
              of pleasure, wine sat on the royal throne.',
              price: 39.19, title: 'Wine' },
            { name: 'Dow\'s 20 Years Old Tawny Port',
              description: 'Dow\'s 20 Years Old Tawny Port 0.75l 20% 93 pts Wine Spectator - For many the perfect age
              for a great Tawny Port. The vibrant purple colour of a great young Port has softened to a delicate
              green-gold after 20 long years in seasoned oak casks under the watchful eye of the master blender and the
              Dow’s head lodge man.',
              price: 32.59, title: 'Wine' },
            { name: 'Martini Asti',
              description: 'Martini Asti White Sweet 0.75l 7.5% wine Martini & Rossi is the leading Italian sparkling
              wine producer. We harvest and store the fresh grape juice of Moscato Bianco grapes, harvested in the Asti
              DOC area. We arrest fermentation to keep the natural sweetness of the ripe musts that give Martini Asti
              its taste and aroma of grape juice, vine peaches, elderberry and sage.',
              price: 9.19, title: 'Wine' },
            { name: 'Paulaner Hefe-Weissbier',
              description: 'Paulaner Hefe-Weissbier Naturtrub 0.5l It’s the #1 wheat beer in Germany and one of the
              world’s favorites. In fact, beer experts call it a masterpiece. In developing this beer, the Paulaner
              brewmasters have perfected a unique technique with “yeast suspension,” resulting in a uniform, slightly
              cloudy appearance, consistent quality, and perfect taste.',
              price: 2.39, title: 'Beer' },
            { name: 'Whitley Neill Sloe Gin',
              description: 'Whitley Neill Sloe Gin 0.7l 28% Whitley Neill Gin is a handcrafted, premium gin that is
              inspired by the very best flavours and ingredients from around the world – and distilled in the heart of
              the City of London. Discover what makes our range of artisanal gins',
              price: 20.79, title: 'Gin' },
            { name: 'Sour Cherry Gin',
              description: 'Luxardo Sour Cherry Gin 0.7l 37.5% Deep red in color, Luxardo Sour Cherry Gin has a
              pungent marasca cherry aroma with intense juniper notes. The initial taste is typical of gin with spicy
              and long lasting sour aftertaste. Luxardo Sour Cherry Gin can be used to twist many classic cocktails
              such as the Martinez and the Gin Fizz, or it can be enjoyed neat or over ice as an after dinner drink.',
              price: 19.99, title: 'Gin' },
            { name: 'The Pogues',
              description: 'The Pogues Irish Whiskey 1l 40% A unique Irish Whiskey created with a passion by master
              whiskey maker Frank McHardy. Exceptionally smooth; enjoy it neat, with ice, with a mixer, in a cocktail,
              or however you damn well want.',
              price: 31.19, title: 'Whiskey' },
            { name: 'Tanqueray',
              description: 'Tanqueray London Dry Gin 0.7l 47.3% Fortune favours the brave. Back in the 1830´s Charles
              Tanqueray wasn\'t afraid to mix his bold ideas. His ingenious pursuit for perfection paid off, creating
              Tanqueray London Dry, a perfectly balanced gin and one of the most awarded gins in the world.',
              price: 13.59, title: 'Gin' },
            { name: 'Finsbury Platinum',
              description: 'Finsbury Platinum Gin 0.7l 47% The Finsbury Platinum London Dry Gin is a steeped in
              tradition English Gin, which spoils the sense of taste with fruity and easy spicy flavours',
              price: 16.59, title: 'Gin' },
            { name: 'Glenmorangie Nectar',
              description: 'Glenmorangie Nectar Whiskey d\'Or 0.7 л 46% With this malt from the core series, Highland
              distillery Glenmorangie creates a solid \'whisky for everyday life\'. Easy to drink, partly due to the
              finish in sauternes casks. This \'Golden Nectar\' is 12 years old and bottled at 46%.',
              price: 59.99, title: 'Whiskey' },
            { name: 'Wieninger Weissbier Hell',
              description: 'Wieninger Weissbier Hell 5.3% 0.5l Eine altbayerische Weißbierspezialität. Süffig und
              natürlich mit Original Wieninger Naturhefe aus eigener Reinzucht. Wieninger Biere sind naturbelassen und
              nicht pasteurisiert.',
              price: 2.19, title: 'Beer' },
            { name: 'City of London Old Tom Gin',
              description: 'City of London Distillery Old Tom Gin 0.7l 40.3% City of London Old Tom Gin is a lightly
              sweetened Old Tom style gin. Bottled at 43% ABV, it features a very traditional list of botanicals. Each
              batch though is small and tightly controlled— produced a scant 200 bottles at a time.',
              price: 19.99, title: 'Gin' }]
categories.each do |title|
  category = Category.find_or_create_by(title:)
  products.each do |product|
    next if title != product[:title]

    Product.create(name: product[:name], description: product[:description], price: product[:price],
                   category_id: category.id)
  end
end
