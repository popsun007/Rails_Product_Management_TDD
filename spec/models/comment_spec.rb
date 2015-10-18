require 'rails_helper'
RSpec.describe Comment, type: :model do
  it 'requires a comment' do
    comment = Comment.new(comment:"")
    comment.valid?
    expect(comment.errors.any?).to eq(true)
  end
  describe 'relationships' do
    it 'belongs to a product' do
    catg = Category.create(name:"Household")
    product = catg.products.create(name: "Hat", description: "2017 spring fashion hat.", pricing: 6.099)
    comment = product.comments.create(comment:"Nice Hat")
    comment2 = product.comments.create(comment:"Testing comment")
    expect(comment.product).to eq(product)
    expect(comment2.product).to eq(product)
    end
  end
end