FactoryBot.define do
  factory :menu

  trait :with_meals do
    after :create do |menu|
      rand(1..3).times do
        menu.menu_items << build(:menu_item, meal: create(:first_course))
        menu.menu_items << build(:menu_item, meal: create(:main_course))
        menu.menu_items << build(:menu_item, meal: create(:beverage))
      end
    end
  end
end
