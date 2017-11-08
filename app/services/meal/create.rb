class Meal
  class Create < ApplicationService
    def initialize(params = {})
      @meal_params = params[:meal_params]
      @form        = params[:form]
      @menu        = params[:menu]
    end

    def call
      ActiveRecord::Base.transaction do
        return unless form.validate(meal_params)

        form.save do |params|
          add_to_menu(params)
        end
      end
    end

    private

    attr_reader :form, :meal_params, :menu

    def add_to_menu(params)
      meal = new_or_existing_meal(params)

      return if menu.meals.include?(meal)
      params = params[:menu_item].symbolize_keys

      MenuItem.create(
        price: params[:price],
        menu:  menu,
        meal:  meal
      )
    end

    def new_or_existing_meal(params)
      params = params[:meal].symbolize_keys

      Meal.find_or_initialize_by(name: params[:name].capitalize) do |meal|
        meal.name   = params[:name].capitalize
        meal.course = params[:course]
      end
    end
  end
end
