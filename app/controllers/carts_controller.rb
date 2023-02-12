class CartsController < ApplicationController
  def show
    @cart = resource
  end

  def add_product_to
    if user_signed_in?
      current_user.cart.products << Product.find(params[:id])
    elsif session[:cart].present?
      session[:cart] << params[:id]
    else
      initialize_session_cart
    end
     redirect_to cart_path
  end

  def remove_product_from
    if user_signed_in?
      current_user.cart.products.destroy(params[:id])
    else
      session[:cart].delete(params[:id])
    end
     redirect_to cart_path
  end

  private

  def resource
    if user_signed_in?
      current_user.cart
    else
      Product.where(id: session[:cart])
    end
  end

  def initialize_session_cart
    session[:cart] = []
    session[:cart] << params[:id]
  end
end
