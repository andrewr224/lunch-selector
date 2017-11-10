require 'rails_helper'

RSpec.feature 'Menus', type: :feature do
  let(:menu) { create(:menu) }

  describe 'index' do
    scenario 'shows all menus' do
      create_list(:menu, 5)
      visit root_path
      expect(page).to have_selector('li', count: 5)
    end
  end

  describe 'create menu' do
    scenario 'creates a menu' do
      visit new_menu_path
      expect { click_on 'Create Menu' }.to change(Menu, :count).by(1)
    end
  end

  describe 'show menu' do
    scenario 'shows individual menu' do
      visit menu_path menu
      expect(page).to have_content 'Menu for'
    end

    context 'when has meals and orders' do
      subject(:menu_with_orders) { create(:menu, :with_orders) }
      scenario 'shows list of orders' do
        visit menu_path menu
        expect(page).to have_content 'Total price:'
      end
    end
  end

  describe 'delete menu' do
    scenario 'delets menu' do
      visit menu_path menu
      expect { click_on 'Delete' }.to change(Menu, :count).by(-1)
    end
  end
end
