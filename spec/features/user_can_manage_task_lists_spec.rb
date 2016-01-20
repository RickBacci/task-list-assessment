require 'rails_helper'

RSpec.feature "User", type: :feature do
  include DatabaseCleaner

  it 'can create a new task list' do
    User.create(email: 'user@email.com', password: 'password')

    visit root_path

    click_link "Login"
    fill_in "Email", with: 'user@email.com'
    fill_in 'Password', with: 'password'
    click_link_or_button "Login"

    expect(page).to have_link('Create New TaskList')

    click_link 'Create New TaskList'

    fill_in "Title", with: 'title'
    fill_in 'description', with: 'description'
    click_link_or_button "Create TaskList"

    expect(page).to have_content('title')
    expect(page).to have_content('description')
  end
end
