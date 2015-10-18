require 'rails_helper'
RSpec.describe 'product details page' do
  it 'displays information about product' do
    catg = Category.create(name:"Household")
    product1 = catg.products.create(name: "Hot", description: "2016 spring fashion hat.", pricing: 4.5)
    visit "/products"
    click_link "Show"
    expect(current_path).to eq("/products/#{product1.id}")
    expect(page).to have_text(product1.name)
    expect(page).to have_text(product1.description)
    expect(page).to have_text("$4.50")
  end
end