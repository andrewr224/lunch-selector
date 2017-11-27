module PolicyHandler
  protected

  def policy(menu)
    MenuPolicy.new(menu)
  end

  def allow_placement?(menu)
    policy(menu).allow_placement?
  end

  def allow_modification?(menu)
    policy(menu).allow_modification?
  end
end
