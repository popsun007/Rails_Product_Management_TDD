class CommentsController < ApplicationController
  def index
    @comments = Comment.all
  end

  def create
    product = Product.find(params[:product_id])
    comment = product.comments.new(comment: params[:comment])
    if comment.valid?
      comment.save
      redirect_to "/products/#{product.id}"
    else
      redirect_to "/products/#{product.id}"
    end
  end

  def destroy
    Comment.find(params[:id]).destroy
    redirect_to "/products/#{params[:product_id]}"
  end
end
