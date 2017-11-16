require 'rails_helper'

RSpec.describe MealDecorator do
  let(:menu) { create(:menu, :with_meals) }

  subject(:meal) { menu.meals.first.decorate }

  describe '#todays_price' do
    it 'returns price' do
      expect(meal.todays_price(menu)).to be_an Integer
    end
  end
end
