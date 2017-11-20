FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "Patric #{n}" }
    sequence(:email) { |n| "patric#{n}@test.com" }
    password 'password'
  end

  trait :admin do
    admin true
  end
end
