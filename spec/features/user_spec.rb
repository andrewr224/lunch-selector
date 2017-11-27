require 'rails_helper'

RSpec.feature User, type: :feature do
  let(:user) { build(:user) }

  def sign_up
    visit root_path

    click_link 'Sign up', match: :first
    within('form') do
      fill_in 'Name',                  with: user.name
      fill_in 'Email',                 with: user.email
      fill_in 'Password',              with: user.password
      fill_in 'Password confirmation', with: user.password
      click_button 'Sign up'
    end
  end

  context 'when not yet signed up' do
    scenario 'can sign up' do
      expect { sign_up }.to change(User, :count).by(1)
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

  context 'when there are no users yet' do
    scenario 'can sign up and become an admin' do
      sign_up

      expect(User.first.admin).to be true
    end
  end

  context 'when there are users already' do
    before { create(:user) }

    scenario 'can sign up but does not become an admin' do
      sign_up

      expect(User.last.admin).to be false
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
