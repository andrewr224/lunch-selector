require 'rails_helper'

RSpec.describe 'Users', type: :feature do
  let(:user) { build(:user) }

  context 'when not yet signed up' do
    scenario 'can sign up' do
      visit root_path
      click_link 'Sign up', match: :first
      within('form') do
        fill_in 'Name',                  with: user.name
        fill_in 'Email',                 with: user.email
        fill_in 'Password',              with: user.password
        fill_in 'Password confirmation', with: user.password
        click_button 'Sign up'
      end

      expect(page).to have_content('You have signed up successfully.')
    end

    scenario 'cannot log in' do
      visit root_path
      click_link 'Log in'
      within('form') do
        fill_in 'Email',    with: user.email
        fill_in 'Password', with: user.password
        click_button 'Log in'
      end

      expect(page).to have_content('Invalid Email or password.')
    end
  end

  context 'when signed up' do
    let(:user) { create(:user) }

    scenario 'can log in' do
      visit root_path
      click_link 'Log in'
      within('form') do
        fill_in 'Email',    with: user.email
        fill_in 'Password', with: user.password
        click_button 'Log in'
      end

      expect(page).to have_content('Signed in successfully.')
    end

    scenario 'can edit profile' do
      sign_in user
      visit root_path
      click_link 'Edit profile'
      within('.edit_user') do
        fill_in 'Name',             with: 'Anthony'
        fill_in 'Current password', with: user.password
        click_button 'Update'
      end

      expect(page).to have_content('Your account has been updated')
    end

    scenario 'can delete profile' do
      sign_in user
      visit root_path
      click_link 'Edit profile'
      within('.button_to') do
        click_button 'Cancel my account'
      end

      expect(page).to have_content('You need to sign in or sign up')
    end
  end
end
