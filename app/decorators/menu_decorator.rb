class MenuDecorator < Draper::Decorator
  delegate_all

  def day_stamp
    "#{created_at.strftime('%A')}, #{created_at.day.ordinalize} of "\
    "#{created_at.strftime('%B')}"
  end

  def placed_orer?(current_user)
    current_user.orders.find_by(menu_id: menu.id)
  end

  def show_price?(current_user)
    current_user.admin? && menu.orders.any?
  end
end
