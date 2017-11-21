class Menu
  class ShowFacade < MenuFacade
    def new_order
      @order ||= menu.orders.new

      build_order_items

      @order = @order.decorate
    end

    def placed_order?(current_user)
      menu.orders.find_by(user: current_user)
    end

    def orders
      @orders ||= menu.orders.decorate
    end

    def show_price?(current_user)
      current_user.admin? && ordered_meals
    end

    def total_cost
      ordered_meals.map(&method(:current_price)).reduce(:+)
    end

    private

    attr_reader :order

    def current_price(meal)
      menu.menu_items.find_by(meal: meal).price
    end

    def ordered_meals
      @ordered_meals ||= Meal.joins(:orders).where(orders: { menu: menu })
    end

    def build_order_items
      Meal.courses.each_key do |course|
        order.order_items.build(meal_attributes: { course: course })
      end
    end
  end
end
