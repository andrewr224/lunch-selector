class CurrentDayPolicy
  def initialize(menu)
    @menu = menu
  end

  def allowed?
    menu.created_at.today?
  end

  private

  attr_reader :menu
end
