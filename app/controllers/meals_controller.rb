class MealsController < ApplicationController
  include MealsHelper
  def create
    @meal = Meal.new(meal_params)
    @meal.menu_id = params[:menu_id]

    @meal.save
    redirect_to menu_path(@meal.menu)
  end
end
