class MealsController < ApplicationController
  def create
    meal = Meal::Create.call(
      meal_params: params[:meal],
      form:        meal_form,
      menu:        menu
    )

    if meal
      notify(:notice, t('.added'))
    else
      notify(:notice, t('.error'))
    end

    redirect_back(fallback_location: root_path)
  end

  private

  def meal_form
    @meal_form ||= MealForm.new(meal: Meal.new, menu_item: MenuItem.new)
  end

  def menu
    @menu ||= Menu.find_by(id: params[:menu_id])
  end
end
