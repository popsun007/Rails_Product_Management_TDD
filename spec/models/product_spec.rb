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