module TestHelpers

  def sign_up
    visit root_path

    click_link "Sign Up"
    fill_in "Email", with: 'user@email.com'
    fill_in 'Password', with: 'password'
    fill_in 'Confirmation', with: 'password'
    click_link_or_button "Create Account"

    click_link "Logout"
  end

  def login
    visit root_path

    click_link 'Login'

    fill_in "Email", with: 'user@email.com'
    fill_in 'Password', with: 'password'

    click_link_or_button "Login"
  end

  def create_tasklist
    click_link 'New TaskList'

    fill_in "Title", with: 'title'
    fill_in 'Description', with: 'description'

    click_link_or_button "Create TaskList"
  end
end
