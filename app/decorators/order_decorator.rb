class OrderDecorator < Draper::Decorator
  delegate_all

  def stamp
    "#{created_at.strftime('%A')}, (#{id})"
  end
end
