class Menu
  class EditFacade
    delegate :meals, to: :menu

    def initialize(params)
      @id = params[:id]
    end

    def new_meal
      @meal ||= MealForm.new(meal: Meal.new, menu_item: MenuItem.new)
    end

    def meal_price(meal)
      meal.menu_items.find_by(menu_id: id).price
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
