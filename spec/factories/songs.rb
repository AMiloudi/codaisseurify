FactoryBot.define do
  factory :songs do
    title         { Faker::Lorem.characters(50) }
    released_year rand(year)
  end
end
