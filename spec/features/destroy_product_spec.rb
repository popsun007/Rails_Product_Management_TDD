require 'rails_helper'
RSpec.describe 'deleting a product' do
  it 'deletes product and redirects to products page' do
    product = Product.create(name: "Hat", description: "2017 spring fashion hat.", pricing: 6.099)
    visit "/products"
    expect(page).to have_text(product.name)
    click_button "delete"
    expect(page).to_not have_text(product.name)
  end
end