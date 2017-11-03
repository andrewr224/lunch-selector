require 'rails_helper'

RSpec.feature 'Meals', type: :feature do
  let(:menu) { create(:menu) }
  let(:name) { 'Pizza' }

  describe 'adding meals' do
    context 'when the form is filled properly' do
      scenario 'creates a new meal' do
        visit edit_menu_path menu
        within('.new_meal') do
          fill_in 'Name', with: name
          click_button 'Submit'
        end
        expect(page).to have_content(name, count: 1)
      end
    end

    context 'when meal name alrady exists' do
      scenario 'does not create a new meal' do
        visit edit_menu_path menu
        within('.new_meal') do
          fill_in 'Name', with: name
          click_button 'Submit'
        end
        expect(page).to have_content(name, count: 1)
      end
    end
  end
end
