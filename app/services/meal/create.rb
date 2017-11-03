class Meal
  class Create < ApplicationService
    def initialize(params = {})
      @meal_parmas = params[:params][:meal]
      @form = params[:form]
      @menu = params[:menu]
    end

    def call
      save_meal
    end

    private

    attr_reader :form, :meal_parmas, :menu

    def save_meal
      if @form.validate(meal_parmas)
        @form.save do |meal_parmas|
          add_to_menu(meal_parmas)
        end
      end
    end

    def add_to_menu(meal_parmas)
      meal = Meal.find_by(name: meal_parmas[:name]) || Meal.create(meal_parmas)

      menu.meals << meal unless menu.meals.include? meal
    end
  end
end
