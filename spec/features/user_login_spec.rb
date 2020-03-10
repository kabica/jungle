require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature, js: true do

  # SETUP

  scenario "They see all products" do

    # create new user
    @user = User.create! name: 'Alejandro', email: 'kev@gmail.com', password: 'alex123abc', password_confirmation: 'alex123abc'
    # visit page
    visit root_path

    # cclick on login (as existing user)
    click_on 'Login'

    # fill in the email and password fields
    fill_in 'email', with: 'kev@gmail.com'
    fill_in 'password', with: 'alex123abc' 
    
    # click on submit button to confirm login
    click_on 'Submit'
    
    # confirm that the page displays what user is logged in 
    expect(page).to have_text 'Signed in as Alejandro |', count: 1
    
    save_and_open_screenshot
 
  end
end