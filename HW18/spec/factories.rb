# frozen_string_literal: true

FactoryBot.define do
  factory :product do
    name { Faker::Music::RockBand.name }
    description { Faker::Music::RockBand.song }
    price { rand(0.99..24.99) }
    category_id { rand(1..4) }
  end
end
