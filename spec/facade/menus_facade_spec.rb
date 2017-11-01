require 'rails_helper'

RSpec.describe 'MenuFacade' do
  let(:menu) do
    Menu.create
  end
  subject(:menu_facade) { MenuFacade.new(menu) }

  describe 'menu' do
    it 'still has a menu object' do
      expect(menu_facade.menu).to be_a Menu
    end

    it 'can access methods from decorators' do
      expect(menu_facade.menu.day_stamp).to include(Time.now.strftime('%B'))
    end
  end

  describe '#new_order' do
    it { expect(menu_facade.new_order).to be_an Order }
  end

  describe '#new_meal' do
    it { expect(menu_facade.new_meal).to be_a Meal }
  end
end
