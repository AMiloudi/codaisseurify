FactoryBot.define do
  factory :song do
    title         { Faker::Lorem.characters(50) }
    released_year 2017
  end
end
