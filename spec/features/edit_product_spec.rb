require 'rails_helper'
RSpec.describe 'product edit page' do
  it 'displays form with current information of product prepopulated' do
    catg = Category.create(name:"Household")
    product = catg.products.create(name: "Hat", description: "2017 spring fashion hat.", pricing: 6.099)
    visit "/products"
    click_link "Show"
    click_link "Edit"
    expect(current_path).to eq("/products/#{product.id}/edit")
    expect(find_field("Product Name").value).to eq(product.name)
    expect(find_field("Price").value).to eq(product.pricing.to_s)
  end
end