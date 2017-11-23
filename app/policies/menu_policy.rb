class MenuPolicy
  def initialize(menu = nil)
    @menu = menu
  end

  def allow_placement?
    menu.nil? || !menu.created_at.today?
  end

  def allow_modification?
    !menu.nil? && menu.created_at.today?
  end

  private

  attr_reader :menu
end
