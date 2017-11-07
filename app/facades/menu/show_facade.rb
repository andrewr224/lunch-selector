class Menu
  class ShowFacade
    delegate :meals, to: :menu

    def initialize(params)
      @id = params[:id]
    end

    def new_order
      @order ||= menu.orders.new
    end

    def orders
      @orders ||= menu.orders.decorate
    end

    def menu
      @menu ||= Menu.find_by(id: id)&.decorate
    end

    def first_course
      meals.select{ |m| m.course == "First Course" }
    end

    def main_course
      meals.select{ |m| m.course == "Main Course" }
    end

    def beverage
      meals.select{ |m| m.course == "Beverage" }
    end

    private

    attr_reader :id
  end
end
