FactoryBot.define do
  factory :meal do
    sequence(:name) { |n| "Tasty stuff #{n}" }
    course { %I[first_course main_course beverage].sample }
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
