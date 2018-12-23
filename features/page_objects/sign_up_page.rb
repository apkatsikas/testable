include RandomUtil
include Capybara::DSL

class SignUpPage
  def sign_up
    password = random_password
    fill_in "user_name", :with => "Test User"
    fill_in "user_email", :with => random_email
    fill_in "user_password", :with => password
    fill_in "user_password_confirmation", :with => password
    page.check "user_agreed_to_terms"
    click_button "Sign Up"
  end
end
