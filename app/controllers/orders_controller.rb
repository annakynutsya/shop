class OrdersController < ApplicationController
  def show
    
  end

  def create
    @order = Order.create(user_id: current_user.id, status: 'completed', ordered_at: DateTime.current)
    # @order_detail = OrderDetail.create(order_id: @order.id)
  ProductOrder.create(order_id: @order.id, product_id: 1, amount: 1)
  #  ProductOrder.create(order_id: params[:order_id], product_id: current_cart.product.id)
     redirect_to root_path
      # @order_details = OrderDetails.create
      # @order_details.order_id = @order.id
      # @product_orders = ProductOrder.create(product_id: CartProduct.where(cart: current_user))
      
      # redirect_to :show
  end

end
