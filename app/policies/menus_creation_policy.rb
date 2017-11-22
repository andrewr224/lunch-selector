class MenusCreationPolicy
  def initialize; end

  def allowed?
    menus = Menu.all
    menus.exists? ? !menus.last.created_at.today? : true
  end
end
