require 'rails_helper'
RSpec.describe 'updating product' do
  it 'updates product and redirects to products page' do
    product = Product.create(name: "Hat", description: "2017 spring fashion hat.", pricing: 6.099)
    visit "/products"
    click_link "Show"
    click_link "Edit"
    expect(current_path).to eq("/products/#{product.id}/edit")
    fill_in "Product Name", with: "Big Hat"
    click_button "Update"
    expect(current_path).to eq("/products")
    expect(page).to have_text("Big Hat")
  end
end