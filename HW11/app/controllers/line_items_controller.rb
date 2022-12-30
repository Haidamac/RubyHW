class LineItemsController < ApplicationController
  def create
    product = Product.find(params[:product_id])
    current_cart.add_product(product)

    redirect_to cart_path, notice: "#{product.name} was successfully added to the cart"
  end
end
