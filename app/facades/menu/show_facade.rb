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
      order.order_items.build(meal_attributes: { course: 'First Course' })
      order.order_items.build(meal_attributes: { course: 'Main Course' })
      order.order_items.build(meal_attributes: { course: 'Beverage' })
    end
  end
end
