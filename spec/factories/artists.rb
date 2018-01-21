FactoryBot.define do
  factory :artists do
    name    { Faker::Lorem.characters(70) }
    genre   { Faker::Lorem.characters(70) }
  end
end
