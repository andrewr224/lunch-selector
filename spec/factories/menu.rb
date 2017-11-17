FactoryBot.define do
  factory :menu do
    user
  end

  trait :with_meals do
    transient do
      meal_count 2
    end

    after :create do |menu, evaluator|
      menu.menu_items << create_list(:menu_item,
                                     evaluator.meal_count,
                                     menu: menu, meal: build(:first_course))
      menu.menu_items << create_list(:menu_item,
                                     evaluator.meal_count,
                                     menu: menu, meal: build(:main_course))
      menu.menu_items << create_list(:menu_item,
                                     evaluator.meal_count,
                                     menu: menu, meal: build(:beverage))
    end
  end

  trait :with_orders do
    transient do
      order_count 2
    end

    after :create do |menu, evaluator|
      evaluator.order_count.times do
        first    = build(:first_course)
        main     = build(:main_course)
        beverage = build(:beverage)
        order    = build(:order, menu: menu)

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
