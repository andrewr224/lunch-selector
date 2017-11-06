class Meal
  class Create < ApplicationService
    def initialize(params = {})
      @meal_parmas = params[:params][:meal]
      @form =        params[:form]
      @menu =        params[:menu]
    end

    def call
      save_meal
    end

    private

    attr_reader :form, :meal_parmas, :menu

    def save_meal
      return unless form.validate(meal_parmas)
      form.save do |valid_params|
        add_to_menu(valid_params)
      end
    end

    def add_to_menu(valid_params)
      meal = meal(valid_params)

      menu.meals << meal unless menu.meals.include? meal
    end

    def meal(valid_params)
      Meal.find_or_create_by(name: valid_params[:name].capitalize)
    end
  end
end
