FactoryBot.define do
  factory :expense do
    date { Faker::Date}
    title { Faker::Lorem.word}
    description { Faker::Lorem.sentence}
    amount { Faker::Number.between(from: 0, to: 10000)}
    # category { Faker::Lorem.word}
    user
    category
    
  end
end
