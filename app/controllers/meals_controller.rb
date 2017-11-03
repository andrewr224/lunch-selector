class MealsController < ApplicationController
  def create
    meal = Meal::Create.call(
      params: params,
      form: MealForm.new(Meal.new),
      menu: menu
    )

    flash.notice = meal ? 'Meal Added!' : 'Not so fast!'

    redirect_back(fallback_location: root_path)
  end

  private

  def menu
    @menu ||= Menu.find_by(id: params[:menu_id])
  end
end
