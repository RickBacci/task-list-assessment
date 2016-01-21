
def sign_in
  visit tasks_path

  click_link "Sign Up"
  fill_in "Email", with: 'user@email.com'
  fill_in 'Password', with: 'password'
  fill_in 'Confirmation', with: 'password'
  click_link_or_button "Create Account"
end

def create_tasklist
  click_link 'New TaskList'

  fill_in "Title", with: 'title'
  fill_in 'Description', with: 'description'

  click_link_or_button "Create TaskList"
end

