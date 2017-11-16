require 'rails_helper'

RSpec.feature 'Meals', type: :feature do
  let(:menu)  { create(:menu) }
  let(:meal)  { create(:meal) }
  let(:name)  { meal.name }
  let(:price) { 12 }

  def submit_the_form
    visit edit_menu_path menu

    within('.new_meal') do
      fill_in id: 'meal_name', with: name
      fill_in id: 'meal_price', with: price
      choose(id: 'meal_course_main_course')
      click_button 'Create Meal'
    end
  end

  describe 'adding meals' do
    context 'when the form is filled properly' do
      scenario 'creates a new meal' do
        expect { submit_the_form }.to change(Menu, :count).by(1)
      end
    end

    context 'when the form is not filled properly' do
      scenario 'does not create a meal without price' do
        visit edit_menu_path menu
        within('.new_meal') do
          fill_in id: 'meal_name', with: name
          click_button 'Create Meal'
        end
        expect(page).to have_no_content(name)
      end

      scenario 'does not create a meal without name' do
        visit edit_menu_path menu
        within('.new_meal') do
          fill_in id: 'meal_price', with: price
          click_button 'Create Meal'
        end
        expect(page).to have_no_content(name)
      end
    end

    context 'when meal name already exists' do
      before do
        submit_the_form
      end

      scenario 'does not create a new meal' do
        expect { submit_the_form }.not_to change(Meal, :count)
      end
    end
  end
end
