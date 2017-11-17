class Meal
  class Create < ApplicationService
    def initialize(params = {})
      @meal_params = params[:meal_params]
      @form        = params[:form]
      @menu        = params[:menu]
    end

    def call
      return unless form.validate(meal_params)

      form.save(&method(:add_to_menu))
    end

    private

    attr_reader :form, :meal_params, :menu

    def add_to_menu(params)
      meal = new_or_existing_meal(params[:meal])

      create_menu_item(params[:menu_item], meal) unless already_added?(meal)
    end

    def create_menu_item(params, meal)
      params = params.symbolize_keys

      MenuItem.create(
        price: params[:price],
        menu:  menu,
        meal:  meal
      )
    end

    def already_added?(meal)
      menu.meals.include?(meal)
    end

    def new_or_existing_meal(params)
      params = params.symbolize_keys

      Meal.find_or_initialize_by(name: params[:name].capitalize) do |meal|
        meal.name   = params[:name].capitalize
        meal.course = params[:course]
      end
    end
  end
end
