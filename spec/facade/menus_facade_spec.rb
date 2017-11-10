require 'rails_helper'

RSpec.describe 'MenuFacade' do
  subject(:menu_facade) { Menu::MenuFacade.new(create(:menu, :with_meals)) }

  it 'still has a menu object' do
    expect(menu_facade.menu).to be_a Menu
  end

  it 'can access methods from decorators' do
    expect(menu_facade.menu.day_stamp).to be_a String
  end

  context 'when menu has meals' do
    let(:meal) { menu_facade.meals.first }

    it 'returns meals sorted by courses' do
      expect(menu_facade.courses).not_to be_empty
    end

    it 'returns price for a given meal' do
      expect(menu_facade.meal_price(meal)).to be_an Integer
    end
  end

  context 'when menu has no meals' do
    subject(:menu_facade) { Menu::MenuFacade.new(create(:menu)) }

    it 'returns empty collections' do
      expect(menu_facade.courses[0]).to be_empty
    end
  end
end

RSpec.describe 'ShowFacade' do
  subject(:menu_facade) { Menu::ShowFacade.new(create(:menu, :with_orders)) }

  describe '#new_order' do
    it { expect(menu_facade.new_order).to be_an Order }
  end

  describe '#total_cost' do
    it "calculates total price for today's orders" do
      expect(menu_facade.total_cost).to be_an Integer
    end
  end
end

RSpec.describe 'EditFacade' do
  subject(:menu_facade) { Menu::EditFacade.new(create(:menu)) }

  describe '#new_meal' do
    it { expect(menu_facade.new_meal).to be_a MealForm }
  end
end
