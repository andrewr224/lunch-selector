require 'rails_helper'

RSpec.describe Meal::Create do
  let(:menu) { Menu.create }
  let(:form) { MealForm.new(Meal.new) }
  let(:meal_params) { { name: 'Pizza', course: 'Main Course' } }
  let(:params) { { meal: meal_params } }

  context 'when meal is not yet in the menu' do
    it 'adds a meal' do
      meal = Meal::Create.call(
        params: params,
        form: MealForm.new(Meal.new),
        menu: menu
      )
      expect(meal).to be_truthy
    end
  end

  context 'when meal is alrready in the menu' do
    before do
      menu.meals.create(meal_params)
    end
    it 'does not add a meal' do
      meal = Meal::Create.call(
        params: params,
        form: MealForm.new(Meal.new),
        menu: menu
      )
      expect(meal).to be_nil
    end
  end
end
