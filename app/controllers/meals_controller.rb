class MealsController < ApplicationController
  def create
    meal = Meal::Create.call(
      meal_params: params[:meal],
      form:        MealForm.new(meal: Meal.new, menu_item: MenuItem.new),
      menu:        menu
    )

    notify(:notice, "#{t(:meal_added)}!") if meal
    notify(:notice, "#{t(:meal_error)}!") unless meal

    redirect_back(fallback_location: root_path)
  end

  private

  def menu
    @menu ||= Menu.find_by(id: params[:menu_id])
  end
end
