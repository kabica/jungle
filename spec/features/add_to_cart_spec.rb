require 'rails_helper'

RSpec.feature "AddToCart", type: :feature, js: true do

  # SETUP
  before :each do
    
  end

  scenario "They see all products" do
    # create new user
    @user = User.create! email: 'kev@gmail.com', password: 'alex123cool'

    # visit page
    visit root_path

    # confirm that cart is currently empty
    expect(page).to have_text 'My Cart (0)', count: 1

    # click on a product to view to details
    click_on 'Add'
    save_and_open_screenshot
    # expect details and product information to be present
    expect(page).to have_text 'My Cart (1)', count: 1

    # commented out b/c it's for debugging only
    save_and_open_screenshot
 
  end
end