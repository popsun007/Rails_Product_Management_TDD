require 'rails_helper'
RSpec.describe 'listing products' do
  it 'displays correct fields to create new product' do
    visit "/products"
    click_link "New Product"
    expect(current_path).to eq("/products/new")
    expect(page).to have_field("Name")
    expect(page).to have_field("Description")
    expect(page).to have_field("Price")
  end
end