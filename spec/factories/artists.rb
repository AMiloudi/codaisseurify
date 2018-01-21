FactoryBot.define do
  factory :artist do
    name    { Faker::Lorem.words(1) }
    genre   { Faker::Lorem.words(1) }
  end
end
