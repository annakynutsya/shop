class OrdersController < ApplicationController
  def new
    @order = Order.new
    @order.build_order_detail
    @order.order_detail.build_adress
  end

  def create
    if user_signed_in?
      @order = Order.new(order_params.merge(product_ids: current_user.cart.products.destroy_all.pluck(:id), user_id: current_user.id))
    else
      @order = Order.new(order_params.merge(product_ids: session[:product_ids]))
      session[:product_ids].clear
    end
    if @order.save
      redirect_to order_path(@order), method: :get
    else
      render :new
    end
  end

  def show
    @order = resource
  end

  private

  def resource
    Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:product_ids, :user_id, order_detail_attributes: [:first_name, :last_name, :email, adress_attributes: [:country, :city, :street, :comment]])
  end
end
