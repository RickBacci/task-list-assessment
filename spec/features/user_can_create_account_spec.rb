require 'rails_helper'

RSpec.feature "User", type: :feature do

  it 'can create an account' do

    visit tasks_path

    click_link "Sign Up"
    fill_in "Email", with: 'user@email.com'
    fill_in 'Password', with: 'password'
    fill_in 'Confirmation', with: 'password'
    click_link_or_button "Create Account"

    expect(page).to have_content('Welcome to Task Manager')
  end

  it 'must have matching confirmation when setting password' do

    visit tasks_path

    click_link "Sign Up"
    fill_in "Email", with: 'user@email.com'
    fill_in 'Password', with: 'password'
    fill_in 'Confirmation', with: 'pass'
    click_link_or_button "Create Account"

    expect(page).to have_content('There was a problem creating your account')
  end
end

