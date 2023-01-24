class CartsController < ApplicationController
  before_action :authenticate_user!
  def show
  end

  def cart_for_reg 
    @cart_reg = Cart.show(user_id: current_user.id)
  end
  private
  def set_cart
    @cart = Cart.find(params[:user_id])
end
end
