class MealsController < ApplicationController
  def create
    form = MealForm.new(menu.meals.new)

    if form.validate(meal_params)
      form.save
      flash[:notice] = 'Meal Added!'
    else
      flash[:error] = 'Something went wrong :('
    end
    redirect_to menu
  end

  private

  def menu
    @menu ||= Menu.find_by(id: params[:menu_id])
  end

  def meal_params
    params.require(:meal).permit(:name, :course, :price, :meal_id)
  end
end
