require 'rails_helper'

RSpec.feature 'Menus', type: :feature do
  context 'create new menu' do
    scenario 'should be successful' do
      visit new_menu_path
      click_button 'Create Menu'
      expect(page).to have_content 'Menu created!'
    end
  end
end
