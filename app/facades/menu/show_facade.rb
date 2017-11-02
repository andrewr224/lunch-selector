class Menu
  class ShowFacade
    delegate :meals, to: :menu

    def initialize(params)
      @id = params[:id]
    end

    def new_order
      @order ||= menu.orders.new
    end

    def new_meal
      @meal ||= MealForm.new(menu.meals.new)
    end

    def orders
      @orders ||= menu.orders.decorate
    end

    def menu
      @menu ||= Menu.find_by(id: id)&.decorate
    end

    private

    attr_reader :id
  end
end
