class CartsController < ApplicationController
    before_action :set_cart
  def show

#binding.pry
  end
  def checkout
  #    binding.pry
      @cart.checkout #class model in module
      redirect_to cart_path(@cart)
  end

  private
  def set_cart
    @cart = Cart.find_by(id: params[:id])
  end
end
