require 'rails_helper'

RSpec.describe Meal::Create do
  let(:form) do
    MealForm.new(
      meal: build(:meal),
      menu_item: build(:menu_item)
    )
  end

  let(:meal) do
    build(:meal, name: 'Pizza', course: 'Main Course')
  end

  let(:meal_params) do
    { meal: attributes_for(:meal),
      menu_item: attributes_for(:menu_item) }
  end

  def create_meal
    described_class.call(
      meal_params: meal_params,
      form:        form,
      menu:        create(:menu)
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
