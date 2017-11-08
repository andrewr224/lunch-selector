class OrderDecorator < Draper::Decorator
  delegate_all

  decorates_association :order_items

  def stamp
    "#{created_at.strftime('%A')}, (#{id})"
  end
end
