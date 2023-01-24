class OrdersController < ApplicationController
    before_action :set_quote, only: [:show, :edit, :update, :destroy]

  def index
    @orders = Order.all
  end

  def show
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(quote_params)

    if @order.save
      redirect_to orders_path, notice: "Order was successfully created."
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @order.update(order_params)
      redirect_to orders_path, notice: "Order was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @order.destroy
    redirect_to orders_path, notice: "Order was successfully destroyed."
  end

  private

  def set_quote
    @order = Order.find(params[:id])
  end

  def quote_params
    params.require(:order).permit(:status, :ordered_at)
  end
end
