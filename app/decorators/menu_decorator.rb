class MenuDecorator < Draper::Decorator
  delegate_all

  def day_stamp
    "#{created_at.strftime('%A')}, "\
    "#{ActiveSupport::Inflector.ordinalize(created_at.day)} of "\
    "#{created_at.strftime('%B')}"
  end
end
