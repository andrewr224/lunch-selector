class MealsController < ApplicationController
  def create
    meal = Meal::Create.call(
      params: params,
      form:   MealForm.new(Meal.new),
      menu:   menu
    )

    meal ? notify_success : notify_failure

    redirect_back(fallback_location: root_path)
  end

  private

  def menu
    @menu ||= Menu.find_by(id: params[:menu_id])
  end

  def notify_success
    flash[:notice] = 'Meal Added!'
  end

  def notify_failure
    flash[:error] = "Achtung! Something's wrong!"
  end
end
