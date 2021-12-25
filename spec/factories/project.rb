FactoryBot.define do
  factory :project do
    title { Faker::FunnyName.name }
    summary { Faker::Lorem.sentence }
  end
end
