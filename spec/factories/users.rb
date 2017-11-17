FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "Patric #{n}" }
    sequence(:email) { |n| "patric#{n}@test.com" }
    password 'password'
  end
end
