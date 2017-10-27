class Meal
  class Creator < ApplicationService
    def initialize(params = {})
      @params = params.fetch(:params, {})
      @menu   = params[:menu]
    end

    def call
      meal.save

      meal
    end

    private

    attr_reader :params, :menu

    def meal
      @meal ||= menu.meals.new(params)
    end
  end
end
