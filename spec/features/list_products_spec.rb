require 'rails_helper'
RSpec.describe 'listing products' do
  it 'displays list of products' do
    catg = Category.create(name:"Household")
    product = catg.products.create(name: 'Shoe', description: 'Walking', pricing: 10.00)
    product = catg.products.create(name: 'Boots', description: 'Not walking', pricing: 535.00)
    visit '/products'
    expect(page).to have_text('Shoe')
    expect(page).to have_text('$10.00')
    expect(page).to have_text('Boots')
    expect(page).to have_text('$535.00')
  end
end