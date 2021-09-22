FactoryBot.define do
  factory :album do
    name { Faker::Music.album }
    year { Faker::Number.between(from: 1900, to: 2021) }
    artist
  end
end