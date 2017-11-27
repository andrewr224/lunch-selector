module PriceCounter
  def total_cost
    ordered_meals.map(&method(:current_price)).reduce(:+)
  end

  private

  def current_price(meal)
    menu.menu_items.find_by(meal: meal)&.price.to_i
  end

  def ordered_meals
    @ordered_meals ||= Meal.joins(:orders).where(orders: { menu: menu })
  end
end
