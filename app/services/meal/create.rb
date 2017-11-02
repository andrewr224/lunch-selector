class Meal
  # this one's obsolete with the new form object
  # leaving it just in case you don't like if/else in the controller
  class Create < ApplicationService
    def initialize(params = {})
      @resource_params = params.fetch(:params, {})
      @menu = params[:menu]
    end

    def call
      meal.save
    end

    private

    attr_reader :resource_params, :menu

    def meal
      @meal ||= menu.meals.new(resource_params)
    end
  end
end
