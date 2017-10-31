class MenuFacade
  attr_reader :menu

  def initialize(menu)
    @menu = menu.decorate
  end

  def new_order
    @order = Order.new(menu_id: menu.id)
  end

  def new_meal
    @meal = Meal.new(menu_id: menu.id)
  end

  def orders
    menu.orders.decorate
  end

  def meals
    menu.meals
  end
end
