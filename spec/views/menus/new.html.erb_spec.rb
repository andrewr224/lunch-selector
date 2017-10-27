require 'spec_helper'

RSpec.describe 'menus/new.html.erb', type: :feature do
  it 'allows to add a new menu' do
    #assign(:menu, Menu.create(id: 1, created_at: Time.now))
    visit new_menu_path
    within 'form' do
      click_button 'Create Menu'
    end
    expect(page).to have_content 'Menu created!'
  end
end
