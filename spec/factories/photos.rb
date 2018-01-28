FactoryBot.define do
  factory :photo do
    artist  { Faker::Lorem.words(1) }
    image_url "MyString"
  end
end
