class MealsController < ApplicationController
  def create
    @form = MealForm.new(Meal.new)

    if @form.validate(params[:meal])
      @form.save do |meal_parmas|
        add_to_menu(meal_parmas)
      end
    end

    redirect_back(fallback_location: root_path)
  end

  private

  def menu
    @menu ||= Menu.find_by(id: params[:menu_id])
  end

  def add_to_menu(meal_parmas)
    meal = Meal.find_by(name: meal_parmas[:name]) || Meal.create(meal_parmas)

    menu.meals << meal unless menu.meals.include? meal
  end
end
