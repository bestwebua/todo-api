FactoryBot.define do
  factory :task do
    name { Faker::StarWars.character }
    done { false }
    project_id { nil }
  end
end
