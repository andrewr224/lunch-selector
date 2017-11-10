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

  trait :with_orders do
    after :create do |menu|
      rand(2..9).times do
        first    = build(:first_course)
        main     = build(:main_course)
        beverage = build(:beverage)
        order    = create(:order, menu: menu)

        menu.menu_items << build(:menu_item, meal: first)
        menu.menu_items << build(:menu_item, meal: main, price: 14)
        menu.menu_items << build(:menu_item, meal: beverage)

        create(:order_item, order: order, meal: first)
        create(:order_item, order: order, meal: main)
        create(:order_item, order: order, meal: beverage)
      end
    end
  end
end
