require 'rails_helper'

RSpec.feature "User can interact with TaskList", type: :feature do
  include DatabaseCleaner

  it 'can create a new task list' do
    User.create(email: 'user@email.com', password: 'password')

    visit root_path

    click_link "Login"
    fill_in "Email", with: 'user@email.com'
    fill_in 'Password', with: 'password'
    click_link_or_button "Login"

    expect(page).to have_link('New TaskList')

    click_link 'New TaskList'

    fill_in "Title", with: 'title'
    fill_in 'Description', with: 'description'

    click_link_or_button "Create TaskList"

    expect(page).to have_content('TaskList successfully created')
  end

  it 'can edit their own tasklist' do
    User.create(email: 'user@email.com', password: 'password')

    visit root_path

    click_link "Login"
    fill_in "Email", with: 'user@email.com'
    fill_in 'Password', with: 'password'
    click_link_or_button "Login"
    click_link 'New TaskList'

    fill_in "Title", with: 'test title'
    fill_in 'Description', with: 'description'

    click_link_or_button "Create TaskList"

    expect(page).to have_content('TaskList successfully created')
    expect(page).to have_content('test title')
    expect(page).to have_content('description')

    click_link_or_button "Edit"

    fill_in "Title", with: 'edited title'
    fill_in 'Description', with: 'edited description'

    click_link_or_button "Update TaskList"

    expect(page).to have_content('TaskList successfully updated!')
    expect(page).to have_content('edited title')
    expect(page).to have_content('edited description')
  end

  it 'can delete their own tasklist' do
    User.create(email: 'user@email.com', password: 'password')

    visit root_path

    click_link "Login"
    fill_in "Email", with: 'user@email.com'
    fill_in 'Password', with: 'password'
    click_link_or_button "Login"
    click_link 'New TaskList'

    fill_in "Title", with: 'test title'
    fill_in 'Description', with: 'description'

    click_link_or_button "Create TaskList"

    expect(page).to have_content('TaskList successfully created')
    expect(page).to have_content('test title')
    expect(page).to have_content('description')

    click_link_or_button "Delete"

    expect(page).to have_content('TaskList deleted!')
    expect(page).to_not have_content('edited title')
    expect(page).to_not have_content('edited description')
  end
end

