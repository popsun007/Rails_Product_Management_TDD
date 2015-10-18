require 'rails_helper'
RSpec.describe 'new comment' do
  it 'displays correct fields to create new comment for a particular product' do
    catg = Category.create(name:"Household")
    product = catg.products.create(name: 'Shoes', description: 'Walking', pricing: 10.00)
    product2 = catg.products.create(name: 'Hot', description: 'Sunning', pricing: 14.00)
    comment = product.comments.create(comment:"Nice shoes")
    comment2 = product2.comments.create(comment:"Comment No.2")
    visit "/products/#{product.id}"
    expect(page).to have_text("Nice shoes")
    expect(page).not_to have_text("Comment No.2")
    visit "/products/#{product2.id}"
    expect(page).to have_text("Comment No.2")
    expect(page).not_to have_text("Nice shoes")
  end
end