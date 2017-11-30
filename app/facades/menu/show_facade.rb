class Menu
  class ShowFacade < MenuFacade
    include PriceCounter

    def new_order
      @order ||= menu.orders.new

      build_order_items

      @order = @order.decorate
    end

    def placed_order?(current_user)
      menu.orders.exists?(user: current_user)
    end

    def orders
      @orders ||= menu.orders.decorate
    end

    def show_price?(current_user)
      current_user.admin? && ordered_meals.exists?
    end

    private

    attr_reader :order

    def build_order_items
      Meal.courses.each_key do |course|
        order.order_items.build(meal_attributes: { course: course })
      end
    end
  end
end
