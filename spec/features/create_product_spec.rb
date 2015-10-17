require 'rails_helper'
RSpec.describe 'creating product' do
  it 'creates a new product and redirect to products page' do
    visit "/products/new"
    fill_in "Product Name", with: "Hat"
    fill_in "Description", with: "2016 spring fashion hat"
    fill_in "Price", with: 3.0
    click_button "Create"
    expect(current_path).to eq("/products")
    expect(page).to have_text("Hat")
    expect(page).to have_text("$3.00")
    expect(page).to have_text("2016 spring fashion hat")
  end
end