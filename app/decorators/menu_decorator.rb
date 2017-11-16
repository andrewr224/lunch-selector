class MenuDecorator < Draper::Decorator
  delegate_all

  def day_stamp
    "#{created_at.strftime('%A')}, #{created_at.day.ordinalize} of "\
    "#{created_at.strftime('%B')}"
  end
end
