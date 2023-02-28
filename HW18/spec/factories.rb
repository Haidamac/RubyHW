# frozen_string_literal: true

FactoryBot.define do
  factory :category do
    title { Faker::Music.genre }

    factory :product do
      name { Faker::Music::RockBand.name }
      description { Faker::Music::RockBand.song }
      price { Faker::Number.decimal }
      category_id { Category.first.id || association(:category.id) }
    end
  end
end
