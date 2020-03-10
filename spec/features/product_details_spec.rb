require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    1.times do |n|
      @category.products.create!(
      name:  Faker::Hipster.sentence(3),
      description: Faker::Hipster.paragraph(4),
      image: open_asset('apparel1.jpg'),
      quantity: 10,
      price: 64.99
      )
    end
  end

  scenario "They see all products" do
    visit root_path
    # click on a product to view to details
    click_on 'Details »'
    
    # expect details and product information to be present
    expect(page).to have_text 'Description', count: 1

    # commented out b/c it's for debugging only
    save_and_open_screenshot
 
  end
end