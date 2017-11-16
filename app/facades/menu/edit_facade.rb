class Menu
  class EditFacade < MenuFacade
    def new_meal
      @meal ||= MealForm.new(meal: Meal.new, menu_item: MenuItem.new)
    end
  end
end
