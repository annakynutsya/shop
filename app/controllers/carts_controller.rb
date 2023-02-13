class CartsController < ApplicationController
  def show
    if user_signed_in?
      @cart = resource
    else
      @products = @cart.present? ? @cart.products : Product.where(id: session[:product_ids])
    end
  end

  def add_product_to
    if user_signed_in?
      current_user.cart.products << Product.find(params[:id])
    elsif session[:product_ids].present?
      session[:product_ids] << params[:id]
    else
      initialize_session_cart
    end
     redirect_to cart_path
  end

  def remove_product_from
    if user_signed_in?
      current_user.cart.products.destroy(params[:id])
    else
      session[:product_ids].delete(params[:id])
    end
     redirect_to cart_path
  end

  private

  def resource
    current_user.cart
  end

  def initialize_session_cart
    session[:product_ids] = []
    session[:product_ids] << params[:id]
  end
end
