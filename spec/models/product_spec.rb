require 'rails_helper'
RSpec.describe Product, type: :model do
  it 'requires a name' do
    product = Product.create(name: "")
    product.valid?
    expect(product.errors.any?).to eq(true)
  end
  it 'requires a pricing' do
    product = Product.new(name:"product", pricing: " ")
    product.valid?
    expect(product.errors.any?).to eq(true)
  end
  it 'requires a description to be at least 7 characters' do
    product = Product.new(name:"product", pricing:"4.65", description:"pro")
    product.valid?
    expect(product.errors.any?).to eq(true)
  end
end

describe 'relationships' do
  it 'belongs to a category' do
    catg = Category.create(name:"Household")
    product = catg.products.create(name:"Shoes", description:"Nice shoes", pricing:18.3)
    product2 = catg.products.create(name:"Hot", description:"Hawaii hat", pricing:12.3)
    expect(catg.products).to include(product)
    expect(catg.products).to include(product2)
  end
end