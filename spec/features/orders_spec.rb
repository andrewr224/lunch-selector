require 'rails_helper'

RSpec.feature 'Orders', type: :feature do
  let(:menu) { create(:menu, :with_meals, meal_count: 1) }
  let(:user)  { create(:user) }

  before { sign_in user }

  def place_order
    visit menu_path menu

    within('.new_order') do
      select 'Taco'
      select 'Tortilla'
      select 'Horchata'
      click_button 'Order'
    end
  end

  describe 'adding orders' do
    scenario 'creates order' do
      expect { place_order }.to change(Order, :count).by(1)
    end
  end

  describe 'editing orders' do
    before do
      place_order
    end

    scenario 'updates order' do
      visit edit_menu_order_path(menu, menu.orders.first)
      within('.edit_order') do
        click_button 'Order'
      end

      expect(page).to have_content 'Order updated.'
    end
  end

  describe 'deleting orders' do
    before do
      place_order
    end

    scenario 'deletes orders, as it is not Mexican' do
      visit menu_path menu

      expect { click_on 'Delete Order' }.to change(Order, :count).by(-1)
    end
  end
end
