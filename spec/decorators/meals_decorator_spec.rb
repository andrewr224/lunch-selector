require 'rails_helper'

RSpec.describe MealDecorator do
  subject(:meal) { create(:main_course).decorate }
  let(:menu) { create(:menu) }

  describe '#todays_price' do
    before do
      create(:menu_item, meal: meal, menu: menu)
    end

    it 'returns price' do
      expect(meal.todays_price(menu)).to be_an Integer
    end
  end
end
