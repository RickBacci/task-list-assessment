require 'rails_helper'

RSpec.feature "User", type: :feature do
  include DatabaseCleaner
  include TestHelpers

  it 'can edit a task' do
    sign_up
    login
    create_tasklist

    click_link 'title'

    click_link 'Create Task'

    fill_in 'Title', with: 'my task'
    fill_in 'Notes', with: 'task notes'
    fill_in 'Start', with: Date.today
    fill_in 'Due'  , with: Date.tomorrow

    click_button 'Create Task'

    expect(page).to have_content('my task')
    expect(page).to have_content('Task successfully created!')

    click_link "Edit Task"

    fill_in 'Title', with: 'my edited task'

    click_button "Update Task"

    expect(page).to have_content('my edited task')
    expect(page).to have_content('Task successfully updated!')
  end
end

# A user can create a task. Tasks must have titles.
# A user can update and adjust the properties of an existing task they own.
# A user can mark a task they own as completed.
# By default, users should only see incomplete tasks they own.
# By default, users should only see tasks with a start date before today.
# A user can see completed tasks they own and mark them as incomplete.
# A user can see scheduled tasks they own with a start date in the future.
