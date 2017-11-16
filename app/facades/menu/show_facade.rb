class Menu
  class ShowFacade < MenuFacade
    def new_order
      @order ||= menu.orders.new

      build_order_items

      @order = @order.decorate
    end

    def orders
      @orders ||= menu.orders.decorate
    end

    def total_cost
      ordered_meals.map(&method(:current_price)).reduce(:+)
    end

    private

    attr_reader :order

    def current_price(meal)
      menu.menu_items.find_by(meal_id: meal.id).price
    end

    def ordered_meals
      menu.orders.flat_map(&:meals)
    end

    def build_order_items
      Meal.courses.each_key do |course|
        order.order_items.build(meal_attributes: { course: course })
      end
    end
  end
end
