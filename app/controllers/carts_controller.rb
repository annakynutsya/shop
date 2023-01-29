class CartsController < ApplicationController
  def show
    if current_user
      cart_products = CartProduct.where(cart: current_user).map(&:product_id)
      @products_order = Product.where(id: cart_products)
    elsif session[:product_id]
      @products_order = Product.where(id: session[:product_id])
    end
  end

  def create
    if current_user
      CartProduct.create(product_id: params[:id], cart_id: current_user.cart.id)
    else
      if session[:product_id]
        session[:product_id] << params[:id].to_s  
      else
        session[:product_id] = [params[:id]][0].to_s
      end
    end
    redirect_to get_cart_path
  end

  def destroy
    if current_user
      CartProduct.find_by(product_id: params[:id], cart_id: current_user.cart.id).destroy
    else
      session[:product_id].delete(params[:id])
    end
    redirect_to get_cart_path
  end
end
