class OrdersController < ApplicationController
  def new
    @order = Order.find_by(params[:order_id])
  end

  def create
    if user_signed_in?
      @order = Order.create(user_id: current_user.id, ordered_at: DateTime.current, status: "Completed")
      products_ids = current_user.cart.cart_products.pluck(:product_id)
      products_ids.each do |item|
        @products_order = ProductOrder.create(order_id: @order.id, product_id: item, amount: 1)
      end
      adress = Adress.new(adress_params)
      adress.user_id = current_user.id
      adress.save
      @order_detail = OrderDetail.new(adress_id: adress.id, order_id: @order.id)
      @order_detail.save
      redirect_to order_path(@order), method: :get
    elsif session[:product_id].present?
      @order = Order.create(ordered_at: DateTime.current, status: "Completed")
      session[:product_id].each do |product_id|
        @products_order = ProductOrder.create(order_id: @order.id, product_id: product_id)
      end
      adress = Adress.create(adress_params)
      @order_detail = OrderDetail.new(order_detail_params)
      @order_detail.order_id = @order.id
      @order_detail.adress_id = adress.id
      @order_detail.save
    end
    clear_cart
  end

  def show
    if user_signed_in?
      @order = resource
      @ordered_products = Product.find(@order.product_ids)
      @total_sum = total_sum
    end
  end

  private

    def adress_params
      params.require(:adress).permit(:country, :city, :street)
    end

    def order_detail_params
      params.require(:order_detail).permit(:first_name, :last_name, :email)
    end

    def resource
      current_user.orders.find(params[:id])
    end

    def clear_cart
      if user_signed_in?
        Cart.clear(current_user.cart.id)
      elsif session[:product_id].present?
        session[:product_id].clear
      end
    end

    def total_sum
      @ordered_products.pluck(:price).inject(&:+)
    end
end
