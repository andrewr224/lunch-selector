class Menu
  class ShowFacade < MenuFacade
    def new_order
      @order ||= menu.orders.new
      @order.order_items.build(meal_attributes: { course: 'First Course' })
      @order.order_items.build(meal_attributes: { course: 'Main Course' })
      @order.order_items.build(meal_attributes: { course: 'Beverage' })

      @order = @order.decorate
    end

    def orders
      @orders ||= menu.orders.decorate
    end
  end
end
