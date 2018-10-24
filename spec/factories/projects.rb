FactoryBot.define do
  factory :project do
    title { Faker::Lorem.word }
    user
  end
end
