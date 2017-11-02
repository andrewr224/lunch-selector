require 'rails_helper'

RSpec.feature 'Menus', type: :feature do
  let(:menu) { Menu.create }

  context 'create new menu' do
    scenario 'should be successful' do
      visit new_menu_path
      click_button 'Create Menu'
      expect(page).to have_content 'Menu created!'
    end
  end

  context 'edit existing menu' do
    scenario 'should be successful' do
      visit edit_menu_path menu
      click_button 'Update Menu'
      expect(page).to have_content 'Menu updated!'
    end
  end
end
