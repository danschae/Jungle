require 'rails_helper'

RSpec.feature "Visitor can see product page", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "They click on product img and is led to the project page" do
    # ACT
    visit root_path
    first('h4').click
    save_screenshot
    # DEBUG
    save_screenshot

    # VERIFY
    expect(page).to have_text '64.99'
  end
end