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
      sum_total = 0

      ordered_meals.flatten.each do |meal|
        sum_total += menu.menu_items.find_by(meal_id: meal.id).price
      end

      sum_total
    end

    private

    attr_reader :order

    def ordered_meals
      ordered_meals_list = []

      menu.orders.each do |order|
        ordered_meals_list << order.meals
      end

      ordered_meals_list
    end

    def build_order_items
      Meal.courses.each_key do |course|
        order.order_items.build(meal_attributes: { course: course })
      end
    end
  end
end
