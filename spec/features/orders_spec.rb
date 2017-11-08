require 'rails_helper'

RSpec.feature 'Orders', type: :feature do
  let(:menu) { create(:menu) }

  before do
    menu.meals.create(name: 'Pasta', course: 'Main Course')
    menu.meals.create(name: 'Tea', course: 'Beverage')
  end

  describe 'adding orders' do
    scenario 'creates a new order' do
      visit menu_path menu
      within('.new_order') do
        click_button 'Submit'
      end
      expect(page).to have_content 'Order placed!'
    end
  end
end
