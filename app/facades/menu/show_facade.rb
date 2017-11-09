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

    private

    attr_reader :order

    def build_order_items
      Meal.courses.each_key do |course|
        order.order_items.build(meal_attributes: { course: course })
      end
    end
  end
end
