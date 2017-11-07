class Menu
  class EditFacade
    delegate :meals, to: :menu

    def initialize(params)
      @id = params[:id]
    end

    def new_meal
      @meal ||= MealForm.new(meal: Meal.new, menu_item: MenuItem.new)
    end

    def menu
      @menu ||= Menu.find_by(id: id)&.decorate
    end

    private

    attr_reader :id
  end
end
