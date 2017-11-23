module PolicyHandler
  # helper_method :allow_placement?, :allow_modification?

  def allow_placement?(menu)
    policy(menu).allow_placement?
  end

  def allow_modification?(menu)
    policy(menu).allow_modification?
  end
end
