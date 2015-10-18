require 'rails_helper'
RSpec.describe Category, type: :model do
  it 'requires a name' do
    category = Category.new(name:" ")
    category.valid?
    expect(category.errors.any?).to eq(true)
  end
  describe 'relationships' do
    it 'has many products' do
      catg = Category.create(name:"Household")
      product = catg.products.create(name:"Shoes", description:"Nice shoes", pricing:18.3)
      product2 = catg.products.create(name:"Hot", description:"Hawaii hat", pricing:12.3)
      expect(catg.products).to include(product)
      expect(catg.products).to include(product2)
    end
  end
end