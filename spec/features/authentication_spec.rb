require 'rails_helper'

RSpec.feature 'Authentication', type: :feature do
  let(:admin) { build(:user) }
  let(:user)  { build(:user) }
  let(:menu)  { create(:menu, :with_meals, meal_count: 1) }

  before do
    admin.save
    user.save
    menu
  end

  def place_order
    visit menu_path menu

    within('.new_order') do
      select 'Taco'
      select 'Tortilla'
      select 'Horchata'
      click_button 'Order'
    end
  end

  context 'when user is an admin' do
    before { sign_in admin }

    describe 'create menu' do
      scenario 'creates a menu' do
        visit root_path
        click_on "Create today's menu"
        expect { click_on 'Create Menu' }.to change(Menu, :count).by(1)
      end
    end
  end

  context 'when user is not an admin' do
    before { sign_in user }

    describe 'create menu' do
      scenario 'creates a menu' do
        visit root_path
        expect(page).to have_no_link("Create today's menu")
      end
    end
  end

  describe 'orders' do
    before do
      sign_in admin
      place_order
    end

    context 'when order belongs to the user' do
      before { sign_in admin }

      scenario 'can edit an order' do
        visit menu_path menu
        expect(page).to have_link('Edit Order')
      end

      scenario 'can delete an order' do
        visit menu_path menu
        expect(page).to have_link('Delete Order')
      end
    end

    context 'when order does not belong to the user' do
      before { sign_in user }

      scenario 'can edit an order' do
        visit menu_path menu
        expect(page).to have_no_link('Edit Order')
      end

      scenario 'can delete an order' do
        visit menu_path menu
        expect(page).to have_no_link('Delete Order')
      end
    end
  end
end
