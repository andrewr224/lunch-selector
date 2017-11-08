class OrderItemDecorator < Draper::Decorator
  delegate_all

  def meals_for_select
    Meal.joins(:menu_items)
        .where(course: meal.course, menu_items: { menu: order.menu })
  end
end
