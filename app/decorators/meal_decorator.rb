class MealDecorator < Draper::Decorator
  delegate_all

  def todays_price(menu)
    meal.menu_items.find_by(menu_id: menu.id).price
  end
end
