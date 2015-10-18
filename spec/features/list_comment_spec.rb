require 'rails_helper'
RSpec.describe 'listing comments' do
  it 'displays list of all comments' do
    catg = Category.create(name:"Household")
    product = catg.products.create(name: 'Shoes', description: 'Walking', pricing: 10.00)
    product2 = catg.products.create(name: 'Hot', description: 'Sunning', pricing: 14.00)
    comment = product.comments.create(comment:"Nice shoes")
    comment2 = product2.comments.create(comment:"Comment No.2")
    visit "/comments"
    expect(page).to have_text("Nice shoes")
    expect(page).to have_text("Comment No.2")
  end
  it 'lists comments related to particular product in product show page' do
    catg = Category.create(name:"Household")
    product = catg.products.create(name: 'Shoes', description: 'Walking', pricing: 10.00)
    comment = product.comments.create(comment:"Nice shoes")
    comment2 = product.comments.create(comment:"Comment No.2")
    visit "/products/#{product.id}"
    expect(page).to have_text("Nice shoes")
    expect(page).to have_text("Comment No.2")
  end
end