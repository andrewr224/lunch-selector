require 'rails_helper'

RSpec.describe 'ShowFacade' do
  subject(:menu_facade) { Menu::ShowFacade.new(Menu.create) }

  it 'still has a menu object' do
    expect(menu_facade.menu).to be_a Menu
  end

  it 'can access methods from decorators' do
    expect(menu_facade.menu.day_stamp).to be_a String
  end

  describe '#new_order' do
    it { expect(menu_facade.new_order).to be_an Order }
  end
end

RSpec.describe 'EditFacade' do
  subject(:menu_facade) { Menu::EditFacade.new(Menu.create) }

  describe '#new_meal' do
    it { expect(menu_facade.new_meal).to be_a MealForm }
  end
end
