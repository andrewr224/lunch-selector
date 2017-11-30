class Order
  class OrderFacade
    include PriceCounter

    def orders
      @orders ||= menu.orders
    end

    def meals(order)
      order.meals.map(&method(:meal_name))
    end

    private

    def meal_name(meal)
      "#{meal.course}: #{meal.name}"
    end

    def menu
      @menu ||= Menu.last
    end
  end
end
