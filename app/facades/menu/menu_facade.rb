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
      Meal.courses.keys.map(&method(:meals_by_course))
    end

    def meals_by_course(course)
      ::MealDecorator.decorate_collection(
        meals.send(course),
        context: { course: course }
      )
    end

    def meal_price(meal)
      meal.menu_items.find_by(menu_id: id).price
    end

    private

    attr_reader :id
  end
end
