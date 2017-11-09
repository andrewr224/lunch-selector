FactoryBot.define do
  factory :meal do
    name 'Pizza'
    course :main_course
  end

  factory :first_course, class: Meal do
    sequence(:name) { |n| "Taco numero #{n}" }
    course :first_course
  end

  factory :main_course, class: Meal do
    sequence(:name) { |n| "Tortilla numero #{n}" }
    course :main_course
  end

  factory :beverage, class: Meal do
    sequence(:name) { |n| "Horchata numero #{n}" }
    course :beverage
  end
end
