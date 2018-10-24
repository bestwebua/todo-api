FactoryBot.define do
  factory :task do
    name { Faker::Lorem.unique.word }
    done { false }
    deadline { nil }
    project
  end
end
