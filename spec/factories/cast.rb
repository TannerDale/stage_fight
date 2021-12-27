FactoryBot.define do
  factory :cast do
    description { Faker::Lorem.sentence }
    position { (0..6).to_a.sample }
    association :user
    association :project
  end
end
