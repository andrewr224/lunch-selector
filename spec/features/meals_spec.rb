require 'rails_helper'

RSpec.feature 'Meals', type: :feature do
  let(:menu) { create(:menu) }

  describe 'adding meals' do
    context 'when the form is filled properly' do
      scenario 'creates a new meal' do
        visit menu_path menu
        within('.new_meal') do
          fill_in 'Name', with: 'Pizza'
          fill_in 'Price', with: '42'
          click_button 'Submit'
        end
        expect(page).to have_content 'Meal Added!'
      end
    end

    context 'when the form is not filled properly' do
      scenario 'does not create a new meal' do
        visit menu_path menu
        within('.new_meal') do
          fill_in 'Name', with: 'Pizza'
          click_button 'Submit'
        end
        expect(page).to have_content ':('
      end

      scenario 'does not create a new meal' do
        visit menu_path menu
        within('.new_meal') do
          fill_in 'Price', with: '42'
          click_button 'Submit'
        end
        expect(page).to have_content ':('
      end
    end
  end
end
