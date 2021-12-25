FactoryBot.define do
  factory :user do
    username { Faker::Fantasy::Tolkien.character }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email }
    password { 'supersecretpassword' }
    password_confirmation { 'supersecretpassword' }
    bio { Faker::Lorem.sentence }
  end
end
