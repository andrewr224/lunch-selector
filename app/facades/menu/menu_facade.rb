class Menu
  class MenuFacade
    delegate :meals, to: :menu

    def initialize(params)
      @id = params[:id]
    end

    def menu
      @menu ||= Menu.find_by(id: id)&.decorate
    end

    def courses
      [first_course, main_course, beverage].compact
    end

    def first_course
      menu.meals.first_course if menu.meals.first_course.any?
    end

    def main_course
      menu.meals.main_course if menu.meals.main_course.any?
    end

    def beverage
      menu.meals.beverage if menu.meals.beverage.any?
    end

    def meal_price(meal)
      meal.menu_items.find_by(menu_id: id).price
    end

    private

    attr_reader :id
  end
end
