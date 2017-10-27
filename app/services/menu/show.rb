class Menu
  class Show < ApplicationService
    def initialize(params = {})
      @id = params[:id]
    end

    def call
      menu = Menu.find_by(id: id)

      return unless menu
      order = Order.new
      order.menu_id = id

      meal = Meal.new
      meal.menu_id = id

      { menu: menu, order: order, meal: meal }
    end

    private

    attr_reader :id
  end
end
