class MealsController < ApplicationController
  def create
    Meal::Creator.call(
      params: meal_params,
      menu:   menu
    )

    redirect_back fallback_location: root_path
  end

  private

  def menu
    @menu ||= Menu.find_by(id: params[:menu_id])
  end

  def meal_params
    params.require(:meal).permit(:name, :course, :price)
  end
end
