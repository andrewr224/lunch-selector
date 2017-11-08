class Menu
  class ShowFacade < MenuFacade
    def new_order
      @order ||= menu.orders.new
    end

    def orders
      @orders ||= menu.orders.decorate
    end
  end
end
