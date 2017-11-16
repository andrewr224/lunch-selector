class OrderDecorator < Draper::Decorator
  delegate_all

  decorates_association :order_items

  def stamp
    order.menu.created_at.strftime('%A')
  end
end
