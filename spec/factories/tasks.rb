FactoryBot.define do
  factory :task do
    name { Faker::Lorem.word }
    done { false }
    deadline { nil }
    project
  end
end
