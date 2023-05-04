class CartsController < ApplicationController
  def show
    @cart_products = resource
  end

  def create
    if user_signed_in?
      CartProduct.create(product_id: params[:id], cart_id: current_user.cart.id)
    elsif session[:product_id]
      session[:product_id] << params[:id]
    end
    redirect_to cart_path
  end

  def destroy
    if current_user
      CartProduct.find_by(product_id: params[:id], cart_id: current_user.cart.id).destroy
    else
      session[:product_id].delete(params[:id])
    end
    redirect_to cart_path
  end

  private

  def resource
    if user_signed_in?
      Product.user_cart_products(current_user.cart.product_ids)
    elsif session[:product_id]
      Product.find(session[:product_id])
    end
  end
end
