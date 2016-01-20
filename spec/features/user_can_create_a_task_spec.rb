require 'rails_helper'

RSpec.feature "User tasks", type: :feature do

  it 'can be created' do

    visit tasks_path

    click_link "Sign Up"
    fill_in "Email", with: 'user@email.com'
    fill_in 'Password', with: 'password'
    fill_in 'Confirmation', with: 'password'
    click_link_or_button "Create Account"

    expect(page).to have_content('Welcome to Task Manager')


  end
  it ''
end


# A task has title, status (complete or incomplete), a text field for notes, a due date, and a start date.
# A user can create a task. Tasks must have titles.
# A user can update and adjust the properties of an existing task they own.
# A user can mark a task they own as completed.
# A user cannot set a start date or due date before the current date.
# By default, users should only see incomplete tasks they own.
# By default, users should only see tasks with a start date before today.
# A user can see completed tasks they own and mark them as incomplete.
# A user can see scheduled tasks they own with a start date in the future.
