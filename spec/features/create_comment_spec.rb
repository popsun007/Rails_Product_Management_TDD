require 'rails_helper'
RSpec.describe 'creating a comment for a product' do
  it 'creates a new comment and redirects to product show page' do
    catg = Category.create(name:"Household")
    product = catg.products.create(name: 'Shoes', description: 'Walking', pricing: 10.00)
    visit "/products/#{product.id}"
    fill_in "comment", with: "This is a comment"
    click_button "Post"
    expect(current_path).to eq("/products/#{product.id}")
    expect(page).to have_text("This is a comment")
  end
end