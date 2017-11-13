require 'rails_helper'

RSpec.feature 'Orders', type: :feature do
  let(:menu) { create(:menu) }

  def add_meals
    create(:menu_item,
           menu: menu,
           meal: build(:meal, name: 'Taco', course: :first_course))
    create(:menu_item,
           menu: menu,
           meal: build(:meal, name: 'Pasta', course: :main_course),
           price: 18)
    create(:menu_item,
           menu: menu,
           meal: build(:meal, name: 'Tortilla', course: :main_course),
           price: 15)
    create(:menu_item,
           menu: menu,
           meal: build(:meal, name: 'Tea', course: :beverage))
    create(:menu_item,
           menu: menu,
           meal: build(:meal, name: 'Horchata', course: :beverage))
  end

  def place_order
    visit menu_path menu

    within('.new_order') do
      select 'Taco'
      select 'Pasta'
      select 'Tea'
      click_button 'Create Order'
    end
  end

  describe 'adding orders' do
    before do
      add_meals
    end
    scenario 'creates a new, semi-Mexican order' do
      visit menu_path menu

      expect { place_order }.to change(Order, :count).by(1)
    end
  end

  describe 'editing orders' do
    before do
      add_meals
      place_order
    end

    # doesn't show meals to choose from
    xscenario 'selects truly Mexican menu' do
      visit edit_menu_order_path(menu, menu.orders.first)
      save_page
      within('.edit_order') do
        click_button 'Submit'
      end

      expect(page).to have_content 'Order for'
    end
  end

  describe 'deleting orders' do
    before do
      add_meals
      place_order
    end

    scenario 'deletes orders, as it is not Mexican' do
      visit menu_path menu

      expect { click_on 'Delete Order' }.to change(Order, :count).by(-1)
    end
  end
end
