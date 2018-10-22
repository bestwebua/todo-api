FactoryBot.define do
  factory :project do
    title { Faker::Lorem.word }
    created_by { Faker::Number.number(10) }
  end
end
