require 'rails_helper'

RSpec.describe 'Users', type: :feature do
  let(:user_params) do
    { name: 'Patric', email: 'test@test.com', password: 123456 }
  end

  context 'when not authenticated' do
    scenario 'can sign up' do
      visit root_path
      click_on 'Sign up', match: :first
      within('form') do
        fill_in 'Name', with: user_params[:name]
        fill_in 'Email', with: user_params[:email]
        fill_in 'Password', with: user_params[:password]
        fill_in 'Password confirmation', with: user_params[:password]
        click_button 'Sign up'
      end

      expect(page).to have_content('You have signed up successfully.')
    end
  end
end
