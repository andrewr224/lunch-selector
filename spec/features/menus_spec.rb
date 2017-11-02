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
      click_button 'Create Menu'
      expect(page).to have_content 'Menu created!'
    end
  end

  describe 'show menu' do
    scenario 'shows individual menu' do
      visit menu_path menu
      expect(page).to have_content 'Menu for'
    end
  end

  describe 'edit menu' do
    scenario 'edits menu' do
      visit menu_path menu
      click_on 'Edit'
      click_button 'Update Menu'
      expect(page).to have_content 'Menu updated!'
    end
  end

  describe 'delete menu' do
    scenario 'delets menu' do
      visit menu_path menu
      click_on 'Delete'
      expect(page).to have_content 'Menu destroyed!'
    end
  end
end
