require 'rails_helper'

RSpec.describe Meal::Create do
  let(:menu) { create(:menu) }
  let(:form) { MealForm.new(meal: build(:meal), menu_item: build(:menu_item)) }
  let(:meal_params) do
    { meal: attributes_for(:meal),
      menu_item: attributes_for(:menu_item) }
  end

  def create_meal
    Meal::Create.call(
      meal_params: meal_params,
      form:        form,
      menu:        menu
    )
  end

  context 'when meal is not yet in the menu' do
    it 'adds a meal' do
      expect { create_meal }.to change(Meal, :count).by(1)
    end
  end

  context 'when meal is alrready in the menu' do
    before do
      create_meal
    end

    it 'does not add a meal' do
      expect { create_meal }.not_to change(Meal, :count)
    end
  end
end
